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
        "Objeto Postado": 1,
        "Objeto recebido pelos Correios do Brasil": 2,
        "Encaminhado para fiscalização aduaneira": 3,
        "Aguardando Pagamento": 4,
        "Pagamento confirmado": 5,
        "De CURITIBA-PR para INDAIATUBA-SP": 6,
        "De CURITIBA-PR para BAURU-SP": 6,
        "De INDAIATUBA-SP para BAURU-SP": 7,
        "De BAURU-SP para PENAPOLIS-SP": 8,
        "Objeto saiu para entrega ao destinatário": 9,
        "Objeto entregue ao destinatário": 10,
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