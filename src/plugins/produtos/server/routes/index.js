module.exports = [
  {
    method: "GET",
    path: "/category/find",
    handler: "category.find",
    config: {
      policies: [],
      auth: false,
    },
  },

  {
    method: "GET",
    path: "/product/findOne/:id",
    handler: "product.findOne",
    config: {
      policies: [],
      auth: false,
    },
  },

  {
    method: "GET",
    path: "/product/find",
    handler: "product.find",
    config: {
      policies: [],
      auth: false,
    },
  },

  {
    method: "PUT",
    path: "/product/delivered/:id",
    handler: "product.delivered",
    config: {
      policies: [],
      auth: false,
    },
  },

  {
    method: "POST",
    path: "/product/tracking",
    handler: "product.tracking",
    config: {
      policies: [],
      auth: false,
    },
  },

];
