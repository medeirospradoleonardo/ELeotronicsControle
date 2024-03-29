module.exports = {
  myJob: {
    task: async ({ strapi }) => {
      console.log('Rastreio Telegram...')

      const products = await strapi.service('plugin::produtos.product').find({
        filters: { delivered: false },
      });

      let codRastreio = []
      let rastreios = []

      products.map((product) => {
        codRastreio.push(product.code)
      })

      if (codRastreio.length > 0) {
        rastreios = await strapi.service('plugin::produtos.product').tracking([codRastreio]);
      }

      let i = 0

      const origemPts = {
        "Objeto não encontrado": 0,
        "Objeto postado": 1,
        "De HONG KONG para Unidade de Tratamento Internacional-BR": 2,
        "Objeto recebido pelos Correios do Brasil": 3,
        "Informações eletrônicas enviadas para análise da autoridade aduaneira": 4,
        "Encaminhado para fiscalização aduaneira": 5,
        "Análise concluída - importação autorizada": 6,
        "Aguardando Pagamento": 7,
        "Pagamento confirmado": 8,
        "De CURITIBA-PR para INDAIATUBA-SP": 9,
        "De VALINHOS-SP para INDAIATUBA-SP": 10,
        "De SAO PAULO-SP para CAJAMAR-SP": 11,
        "De CURITIBA-PR para BAURU-SP": 12,
        "De INDAIATUBA-SP para BAURU-SP": 13,
        "De VALINHOS-SP para BAURU-SP": 14,
        "De CAJAMAR-SP para BAURU-SP": 15,
        "De BAURU-SP para PENAPOLIS-SP": 16,
        "Objeto saiu para entrega ao destinatário": 17,
        "Objeto entregue ao destinatário": 18,
      }

      products.map(async (product) => {
        if (!product.delivered) {
          if (rastreios[i].eventos != null) {
            product['status'] = rastreios[i].eventos[0].descricao
          } else {
            product['status'] = "Objeto não encontrado"
          }
          i++
        } else {
          product['status'] = "Objeto entregue ao destinatário"
        }

        const ptsLast = origemPts[product.lastUpdate] || 0
        const ptsStatus = origemPts[product.status] || 0
        // Se o status mudar
        if (product.status !== product.lastUpdate && product.status !== "Objeto não encontrado" && (ptsStatus > ptsLast)) {
          // Atualiza
          await strapi.entityService.update('plugin::produtos.product', product.id, {
            data: {
              lastUpdate: product.status,
            },
          })

          // Manda pro telegram
          await strapi.service('plugin::produtos.product').telegram(product);
        }
      })
    },
    options: {
      rule: '*/30 * * * *',
    },
  },
};