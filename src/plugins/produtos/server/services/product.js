"use strict";

module.exports = ({ strapi }) => ({
  async find(query) {
    return await strapi.entityService.findMany("plugin::produtos.product", {
      populate: '*',
    });
  },

  async delivered(id) {
    return await strapi.entityService.update("plugin::produtos.product", id, {
      data: { delivered: true },
    });
  },
});
