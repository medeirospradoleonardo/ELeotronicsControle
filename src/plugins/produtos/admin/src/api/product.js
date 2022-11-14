import { request } from "@strapi/helper-plugin";
import pluginId from '../../../admin/src/pluginId';

const productRequests = {

  getProduct: async (id) => {
    return await request(`/${pluginId}/product/findOne/${id}`, {
      method: "GET",
    });
  },

  getAllProducts: async () => {
    return await request(`/${pluginId}/product/find`, {
      method: "GET",
    });
  },

  delivered: async (id) => {
    return await request(`/${pluginId}/product/delivered/${id}`, {
      method: "PUT",
    });
  },

  tracking: async (codRastreio) => {

    return await request(`/${pluginId}/product/tracking`, {
      method: "POST",
      body: {
        codRastreio: codRastreio
      }
    });
  },
};

export default productRequests;
