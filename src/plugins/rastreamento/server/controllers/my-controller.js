'use strict';

module.exports = ({ strapi }) => ({
  index(ctx) {
    ctx.body = strapi
      .plugin('rastreamento')
      .service('myService')
      .getWelcomeMessage();
  },
});
