import { request } from "@strapi/helper-plugin";
import pluginId from '../../../admin/src/pluginId';

const categoryRequests = {
  getAllCategorys: async () => {
    return await request(`/${pluginId}/category/find`, {
      method: "GET",
    });
  }
};

export default categoryRequests;
