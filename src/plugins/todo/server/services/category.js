"use strict";

module.exports = ({ strapi }) => ({
  async find(query) {
    return await strapi.entityService.findMany("plugin::todo.category", {
      populate: '*',
    });
  }
});
