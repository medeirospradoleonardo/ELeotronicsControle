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
      
      if(codRastreio.length > 0){ 
        // rastreios = await productRequests.tracking(codRastreio)
        rastreios = await strapi.service('plugin::produtos.product').tracking(codRastreio);
      }
  
      let i = 0
      products.map(async (product) => {
        if (!product.delivered) {
          if(rastreios[i].eventos != null){
            if (rastreios[i].eventos[0].descricao == "Objeto em trânsito - por favor aguarde") {
              if(rastreios[i].eventos[0].unidade.endereco.cidade != null){
                product['status'] = `De ${rastreios[i].eventos[0].unidade.endereco.cidade.trim()}-${rastreios[i].eventos[0].unidade.endereco.uf.trim()} para ${rastreios[i].eventos[0].unidadeDestino.endereco.cidade.trim()}-${rastreios[i].eventos[0].unidadeDestino.endereco.uf.trim()}`
              }else{
                product['status'] = `De ${rastreios[i].eventos[0].unidade.nome.trim()} para ${rastreios[i].eventos[0].unidadeDestino.nome.trim()}-${rastreios[i].eventos[0].unidadeDestino.endereco.uf.trim()}`
              }
            } else {
              product['status'] = rastreios[i].eventos[0].descricao
              if (product['status'] == "Objeto entregue ao destinatário") {
                delivered(product)
              }
            }
          }else{
            product['status'] = "Objeto não encontrado"
          }
          i++
        } else {
          product['status'] = "Objeto entregue ao destinatário"
        }

        // Se o status mudar
        if(product.status !== product.lastUpdate){
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
      rule: '*/10 * * * *',
    },
  },
};