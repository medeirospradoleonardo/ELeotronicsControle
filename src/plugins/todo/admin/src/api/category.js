import { request } from "@strapi/helper-plugin";

const categoryRequests = {
  getAllCategorys: async () => {
    return await request("/todo/category/find", {
      method: "GET",
    });
  }
};

export default categoryRequests;
