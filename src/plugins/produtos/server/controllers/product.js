"use strict";

module.exports = {

  async findOne(ctx) {
    try {
      ctx.body = await strapi
        .plugin("produtos")
        .service("product")
        .findOne(ctx.params.id);
    } catch (err) {
      ctx.throw(500, err);
    }
  },

  async find(ctx) {
    try {
      return await strapi.plugin("produtos").service("product").find(ctx.query);
    } catch (err) {
      ctx.throw(500, err);
    }
  },

  async delivered(ctx) {
    try {
      ctx.body = await strapi
        .plugin("produtos")
        .service("product")
        .delivered(ctx.params.id);
    } catch (err) {
      ctx.throw(500, err);
    }
  },

  async tracking(ctx) {
    try {
      return await strapi.plugin("produtos").service("product").tracking(ctx.request.body);
    } catch (err) {
      ctx.throw(500, err);
    }
  },
};
