const axios = require('axios')

async function request(url, options) {
  return new Promise((resolve, reject) => {
    axios({ ...options, url })
      .then(response => {
        return resolve(response);
      })
      .catch(error => {
        reject(error);
      });
  });
}

URL = {
  BASECEP: 'https://viacep.com.br/ws',
  BASECORREIOS: 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx',
  BASERASTREIO: 'https://www.linkcorreios.com.br',
  WIDENET: 'https://cep.widenet.host/busca-cep/api/cep',
  PROXYAPP_RASTREAR: 'https://proxyapp.correios.com.br/v1/sro-rastro',
  PROXYAPP_TOKEN: 'https://proxyapp.correios.com.br/v1/app-validation',
}

// Token Constante da requisição de PROXYAPP_RASTREAR
const REQUEST_TOKEN = 'YW5kcm9pZDtici5jb20uY29ycmVpb3MucHJlYXRlbmRpbWVudG87RjMyRTI5OTc2NzA5MzU5ODU5RTBCOTdGNkY4QTQ4M0I5Qjk1MzU3OA=='

// Guarda o token em cache e a data de expiração
let tokenValue = null;
let tokenExpiration = 0;
let tokenPromise = null;

function rastrearEncomendas(codes) {

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
    request(URL.PROXYAPP_TOKEN, {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'user-agent': 'Dart/2.18 (dart:io)',
      },
      data: {
        requestToken: REQUEST_TOKEN
      }
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
      reject(new Error('Falha ao autenticar requisição'))
    })
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
        request(`${URL.PROXYAPP_RASTREAR}/${code}`, {
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
        })
      })
      .catch(reject)
  })
}

export default rastrearEncomendas