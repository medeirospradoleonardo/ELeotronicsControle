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
    const http = require('http')
    const https = require('https')


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

    const crypto = require('crypto')

    const currentDate = new Date();
    const day = String(currentDate.getDate()).padStart(2, '0');
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const year = String(currentDate.getFullYear());
    const hours = String(currentDate.getHours()).padStart(2, '0');
    const minutes = String(currentDate.getMinutes()).padStart(2, '0');
    const seconds = String(currentDate.getSeconds()).padStart(2, '0');

    // Token Constante da requisição de PROXYAPP_RASTREAR
    const REQUEST_TOKEN =
      'rPgi596V7vNHkEJwJA0eW30hUeJNqvKcHVdhfcX3CDuNCFu3KT5XgkbDf2iFc/g7nuGbFx4bNOBUEieF0k+jICMcWRN+ug0asYGwMM511vBzfbLotGy6IR5Ya0jUjx+N/EAhJM3jjxYUudPZLWIdwoL/B23mPvbQEXAyWcEAxHS7JUOgC9p/Zj/RHXtF9W3iK1TfRdk1CjNP5UmwUdGWwawgvfPY7Fof9nPrHMz/MkeYn0/PSemHHhJ3TdHCFc0h/MrWDSjsTtznZbpQcZZL4rAes9vOoN8SWJgyLmK21qXeErdB1OljK/VYbBvTfTzEcoOWM3/4Z3jGPyxM+a77Mg==';
    const REQUEST_DATA = `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
    const REQUEST_SIGN = crypto
      .createHash('md5')
      .update(`requestToken${REQUEST_TOKEN}data${REQUEST_DATA}`)
      .digest('hex');

    // Guarda o token em cache e a data de expiração
    let tokenValue= null;
    let tokenExpiration= 0;
    let tokenPromise= null;

    function rastrearEncomendas(codes) {
      /**
       * @param {Array[String]} codes
       * Função responsável por realizar a consulta de uma ou mais encomendas
       */

      const response = Promise.all(
        codes.map((code) => fetchTrackingService(code)),
      ).then(object => object);
      return response;
    }

    function gerarTokenApp() {
      /**
       * Função responsável por gerar um token para realizar a consulta de encomendas caso o token não esteja em cache
       */

      // Checa se o token está em cache e se não está expirado
      if (tokenValue && tokenExpiration > Date.now()) {
        return Promise.resolve(tokenValue);
      }

      // Checa se já existe uma promise de token em andamento
      if (tokenPromise) {
        return tokenPromise;
      }

      // Cria uma nova promise de token
      tokenPromise = new Promise((resolve, reject) => {
        request('https://proxyapp.correios.com.br/v3/app-validation', {
          method: 'POST',
          headers: {
            'content-type': 'application/json',
            'user-agent': 'Dart/2.18 (dart:io)',
          },
          data: {
            requestToken: REQUEST_TOKEN,
            data: REQUEST_DATA,
            sign: REQUEST_SIGN,
          },
        })
          .then((body) => {
            tokenPromise = null;
            const jwt = body.data.token;
            // Parseia o JWT para pegar a data de expiração (iat)
            const jwtData = jwt.split('.')[1];
            const jwtBuffer = Buffer.from(jwtData, 'base64');
            const jwtString = jwtBuffer.toString('ascii');
            const jwtObject = JSON.parse(jwtString);
            // Guarda o token em cache e a data de expiração
            tokenValue = jwt;
            tokenExpiration = jwtObject.exp * 1000 - 120000; // 120 segundos de margem
            resolve(jwt);
          })
          .catch((err) => {
            tokenValue = null;
            tokenExpiration = 0;
            tokenPromise = null;
            reject(new Error('Falha ao autenticar requisição'));
          });
      });

      return tokenPromise;
    }

    function fetchTrackingService(code) {
      /**
       * @param {string} code
       */
      return new Promise((resolve, reject) => {
        // Gera um token para realizar a consulta
        gerarTokenApp()
          .then((token) => {
            // Realiza a consulta
            request(`https://proxyapp.correios.com.br/v1/sro-rastro/${code}`, {
              method: 'GET',
              headers: {
                'content-type': 'application/json',
                'user-agent': 'Dart/2.18 (dart:io)',
                'app-check-token': token,
              },
            })
              .then((body) => {
                // Retorna o resultado da consulta
                return resolve(body.data.objetos[0]);
              })
              .catch((error) => {
                reject(error);
              });
          })
          .catch(reject);
      });
    }

    let codRastreio = Object.values(query);
    let rastreios = []
    
    if(typeof(codRastreio[0]) === 'string'){
      await rastrearEncomendas(codRastreio).then(response => {
        rastreios = response
      });
    }else {
      await rastrearEncomendas(codRastreio[0]).then(response => {
        rastreios = response
      });
    }

    return rastreios
  },

  async telegram(product) {
    const TelegramBot = require('node-telegram-bot-api')

    const telegramChatIds = process.env.TELEGRAM_CHAT_IDS?.split(", ");

    const bot = new TelegramBot(process.env.TELEGRAM_TOKEN, {polling: false})

    telegramChatIds?.map((telegramChatId) => {
      bot.sendMessage(telegramChatId.replace("'", ""), `*${product.category.name} - ${product.name}* \n✈️ ${product.status} \n📍 ${product.local}`, { parse_mode: 'Markdown' });
    })

    return
  },
});
