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

        OrigemPts = {
          "CURITIBA-PR": 1,
          "INDAIATUBA-SP": 2,
          "BAURU-SP": 3,
          "PENAPOLIS-SP ": 4,
        }

        // Se o status mudar
        if (product.status !== product.lastUpdate && product.status !== "Objeto não encontrado") {
          let send = false
          if (!product.status.includes('De ') && product.lastUpdate.includes('De ')) {
            send = true
          } else {
            if (product.status.includes('De ') && product.lastUpdate.includes('De ')) {
              if (OrigemPts[product.lastUpdate.split(' ')[1]] > OrigemPts[product.status.split(' ')[1]]) {
                send = true
              }
            }
          }

          if (send) {
            // Atualiza
            await strapi.entityService.update('plugin::produtos.product', product.id, {
              data: {
                lastUpdate: product.status,
              },
            })

            // Manda pro telegram
            await strapi.service('plugin::produtos.product').telegram(product);
          }
        }
      })
    },
    options: {
      rule: '*/30 * * * *',
    },
  },
};