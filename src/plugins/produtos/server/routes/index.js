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
    path: "/product/find",
    handler: "product.find",
    config: {
      policies: [],
      auth: false,
    },
  },

];
