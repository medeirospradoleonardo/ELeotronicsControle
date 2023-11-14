"use strict";

module.exports = ({ strapi }) => ({

  async findOne(id) {
    return await strapi.entityService.findOne("plugin::produtos.product", id, {
      populate: '*',
    });
  },

  async find(query) {
    return await strapi.entityService.findMany("plugin::produtos.product", {
      populate: '*',
      ...query
    });
  },

  async delivered(id) {
    return await strapi.entityService.update("plugin::produtos.product", id, {
      data: { delivered: true },
    });
  },

  async tracking(query) {
    const axios = require('axios')
    const convert = require("xml-js");

    const getStringFiltered = (s) => {
      return s.replace(/(\r\n|\n|\r)/gm, "").trim()
    }

    // solucao websro
    // async function request(url, options) {
    //   return new Promise((resolve, reject) => {
    //     axios({ ...options, url: url })
    //       .then(response => {
    //         return resolve(response);
    //       })
    //       .catch(error => {
    //         reject(error);
    //       });
    //   });
    // }

    async function request(url, options) {
      return new Promise((resolve, reject) => {
        axios({ ...options, url: url })
          .then(response => {
            resolve(response);
          })
          .catch(error => {
            resolve(error);
          });
      });
    }

    let rastreios = []

    let codRastreio = Object.values(query);

    // solucao websro
    // rastreios = await Promise.all(codRastreio[0].map(async (codigo) => (
    //   await request(`https://www.websro.com.br/rastreamento-correios.php?P_COD_UNI=${codigo}`, {
    //     method: 'GET',
    //     headers: {
    //       'content-type': 'text/xml',
    //       'user-agent': 'Dart/2.18 (dart:io)',
    //     }
    //   }).then(async (body) => {

    //     if (body.data.split('<li>Status: <b>').length > 1) {
    //       let status = body.data.split('<li>Status: <b>')[1].split('</b></li>')[0]
    //       switch (status) {
    //         case 'Objeto em trânsito - por favor aguarde':
    //           const origem = body.data.split('<li>Origem: ')[1].split('</li>')[0]
    //             .replace('Unidade de Tratamento - ', '')
    //             .replace('Unidade de Distribuição - ', '')
    //             .replace('Agência dos Correios - ', '')
    //             .replace(/( )+/g, ' ').replace(' / ', '-').toUpperCase()

    //           const destino = body.data.split('<li>Destino: ')[1].split('</li>')[0]
    //             .replace('Unidade de Tratamento - ', '')
    //             .replace('Unidade de Distribuição - ', '')
    //             .replace('Agência dos Correios - ', '')
    //             .replace(/( )+/g, ' ').replace(' / ', '-').toUpperCase()

    //           status = `De ${origem} para ${destino}`
    //           break;
    //         case 'Fiscalização aduaneira concluída - aguardando pagamento':
    //           status = 'Aguardando Pagamento'
    //           break
    //         case 'Objeto está em rota de entrega':
    //           status = 'Objeto saiu para entrega ao destinatário'
    //           break
    //         default:
    //           break;
    //       }
    //       return (
    //         {
    //           "eventos": [
    //             {
    //               "descricao": status
    //             }
    //           ]

    //         }
    //       )
    //     } else {
    //       return (
    //         {
    //           "eventos": null
    //         }
    //       )
    //     }
    //   }).catch(() => {
    //     return (
    //       {
    //         "eventos": null
    //       }
    //     )
    //   })
    // )))
    const codigos = codRastreio[0]
    for (let codigo of codigos) {
      let newData = 'Too Many Requests'
      while (newData.includes('Too Many Requests')) {
        const res = await request(`https://api.linketrack.com/track/json?user=teste&token=1abcd00b2731640e886fb41a8a9671ad1434c599dbaa0a0de9a5aa619f29a83f&codigo=${codigo}`, {
          method: 'GET',
          headers: {
            'content-type': 'text/xml',
            'user-agent': 'Dart/2.18 (dart:io)',
          }
        })


        if (res.response) {
          newData = res.response.data
        } else {
          newData = ''
          if (res.data.eventos.length > 0) {
            let evento = res.data.eventos.reduce(function (a, b) {
              return new Date(`${a.data.split("/").reverse().join("/").replaceAll('/', '-')}T${a.hora}`) > new Date(`${b.data.split("/").reverse().join("/").replaceAll('/', '-')}T${b.hora}`) ?
                a : b;
            })

            let status = evento.status

            switch (status) {
              case 'Objeto encaminhado':
                const origem = evento.local
                  .replace('Unidade de Tratamento - ', '')
                  .replace('Unidade de Distribuição - ', '')
                  .replace('Unidade de Logística Integrada - ', '')
                  .replace('Agência dos Correios - ', '')
                  .replace('/', '-').toUpperCase()
                  .replace(' - ', '-')
                status = `Saiu de ${origem}`
                break;
              case 'Fiscalização aduaneira concluída - aguardando pagamento':
                status = 'Aguardando Pagamento'
                break
              case 'Objeto está em rota de entrega':
                status = 'Objeto saiu para entrega ao destinatário'
                break
              default:
                break;
            }
            rastreios.push(
              {
                "eventos": [
                  {
                    "descricao": status
                  }
                ]

              }
            )

          } else {
            rastreios.push(
              {
                "eventos": null
              }
            )
          }
        }
      }
    }

    return rastreios
  },

  async telegram(product) {
    const TelegramBot = require('node-telegram-bot-api')

    const telegramChatIds = process.env.TELEGRAM_CHAT_IDS?.split(", ");

    const bot = new TelegramBot(process.env.TELEGRAM_TOKEN, { polling: false })

    telegramChatIds?.map((telegramChatId) => {
      bot.sendMessage(telegramChatId.replace("'", ""), `*${product.category.name} - ${product.name}* \n✈️ ${product.status} \n📍 ${product.local}`, { parse_mode: 'Markdown' });
    })

    return
  },
});
