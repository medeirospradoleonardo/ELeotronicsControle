import { request } from "@strapi/helper-plugin";
import pluginId from '../../../admin/src/pluginId';

const productRequests = {
  getAllProducts: async () => {
    return await request(`/${pluginId}/product/find`, {
      method: "GET",
    });
  }
};

export default productRequests;
