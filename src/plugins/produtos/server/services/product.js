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
      await request(`https://www.cepcerto.com/ws/encomenda/${codigo}/`, {
        method: 'GET',
        headers: {
          'content-type': 'text/xml',
          'user-agent': 'Dart/2.18 (dart:io)',
        }
      }).then((body) => {
        const data = JSON.parse(
          convert.xml2json(body.data, { compact: true, spaces: 2 })
        );

        if (data.xml.row?.Erro?._text) {
          return (
            {
              "eventos": null
            }
          )
        } else {
          return (
            {
              "eventos": data.xml.row.map((evento) => {
                return {
                  "descricao": getStringFiltered(evento.descricao._text),
                  "unidade": evento.cidade._text ? {
                    "endereco": {
                      "cidade": getStringFiltered(evento.cidade._text),
                      "uf": getStringFiltered(evento.uf._text)
                    }
                  } : null
                }
              })
            }
          )
        }
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
