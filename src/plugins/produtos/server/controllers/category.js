"use strict";

module.exports = {
  async find(ctx) {
    try {
      return await strapi.plugin("produtos").service("category").find(ctx.query);
    } catch (err) {
      ctx.throw(500, err);
    }
  }
};
