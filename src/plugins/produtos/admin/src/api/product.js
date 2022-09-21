import { request } from "@strapi/helper-plugin";
import pluginId from '../../../admin/src/pluginId';

const productRequests = {
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
};

export default productRequests;
