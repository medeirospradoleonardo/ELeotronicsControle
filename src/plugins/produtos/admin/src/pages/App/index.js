import React from 'react';
import {
  Layout
} from "@strapi/design-system/Layout";
import { Switch, Route } from 'react-router-dom';
import { NotFound } from '@strapi/helper-plugin';
import pluginId from '../../pluginId';
import HomePage from '../HomePage';
import PluginSubNav from "../../components/PluginSubNav";

import categoryRequests from "../../api/category";
import { useEffect, useState } from 'react';

export default function App() {
  const [num, setNum] = useState([]);
  const [linksData, setLinksData] = useState([]);

  useEffect(() => {
    async function getData() {
      const result = await categoryRequests.getAllCategorys();
      let links = [];

      result.map((category, i) => {
        links.push({
          id: category.id,
          label: category.name,
          to: category.name,
        })
      })

      setLinksData(links);
      setNum(result);
    }

    getData();
  }, []);

  return (
    // <div>
    //   <Switch>
    //     <Route path={`/plugins/${pluginId}`} component={() => (<HomePage categoryId={0} categoryName={'Todos os produtos'} />)} exact />
    //     {num.map(c => <Route path={`/plugins/${pluginId}/${c.name.replace(" ", "")}`} component={() => (<HomePage categoryId={c.id} categoryName={c.name} />)} key={c.id} exact />)}
    //     <Route component={NotFound} />
    //   </Switch>
    // </div>
    <Layout sideNav={<PluginSubNav links={linksData} />}>
      <Switch>
        <Route path={`/plugins/${pluginId}`} component={() => (<HomePage categoryId={0} categoryName={'Todos os produtos'} />)} exact />
        {num.map(c => <Route path={`/plugins/${pluginId}/${c.name.replace(" ", "")}`} component={() => (<HomePage categoryId={c.id} categoryName={c.name} />)} key={c.id} exact />)}
        <Route component={NotFound} />
      </Switch>
    </Layout>
  );
}

// const App = () => {
//   return (
//     <div>
//       <Switch>
//         <Route path={`/plugins/${pluginId}`} component={HomePage} exact />
//         <Route path={`/plugins/${pluginId}/1`} component={HomePage} exact />
//         <Route path={`/plugins/${pluginId}/2`} component={HomePage} exact />
//         <Route component={NotFound} />
//       </Switch>
//     </div>
//   );
// };

// export default App;
