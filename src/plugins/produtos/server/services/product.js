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

    async function request(url, options) {
      return new Promise((resolve, reject) => {
        axios({ ...options, url: url })
          .then(response => {
            return resolve(response);
          })
          .catch(error => {
            reject(error);
          });
      });
    }

    let rastreios = []

    let codRastreio = Object.values(query);

    rastreios = await Promise.all(codRastreio[0].map(async (codigo) => (
      await request(`https://www.websro.com.br/rastreamento-correios.php?P_COD_UNI=${codigo}`, {
        method: 'GET',
        headers: {
          'content-type': 'text/xml',
          'user-agent': 'Dart/2.18 (dart:io)',
        }
      }).then(async (body) => {

        if (body.data.split('<li>Status: <b>').length > 1) {
          let status = body.data.split('<li>Status: <b>')[1].split('</b></li>')[0]
          if (status == 'Objeto em trânsito - por favor aguarde') {
            const origem = body.data.split('<li>Origem: ')[1].split('</li>')[0].replace('Unidade de Tratamento - ', '').replace(/\s/g, '').replace('/', '-').toUpperCase()
            const destino = body.data.split('<li>Destino: ')[1].split('</li>')[0].replace('Unidade de Tratamento - ', '').replace(/\s/g, '').replace('/', '-').toUpperCase()
            status = `De ${origem} para ${destino}`
          }
          return (
            {
              "eventos": [
                {
                  "descricao": status
                }
              ]

            }
          )
        } else {
          return (
            {
              "eventos": null
            }
          )
        }
      }).catch(() => {
        return (
          {
            "eventos": null
          }
        )
      })
    )))

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
