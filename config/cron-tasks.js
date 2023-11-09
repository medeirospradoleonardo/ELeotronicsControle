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

        // Se o status mudar
        if (product.status !== product.lastUpdate) {
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