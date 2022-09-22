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
    });
  },

  async delivered(id) {
    return await strapi.entityService.update("plugin::produtos.product", id, {
      data: { delivered: true },
    });
  },
});
