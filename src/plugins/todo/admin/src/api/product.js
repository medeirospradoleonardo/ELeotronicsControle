import { request } from "@strapi/helper-plugin";

const productRequests = {
  getAllProducts: async () => {
    return await request("/todo/product/find", {
      method: "GET",
    });
  }
};

export default productRequests;
