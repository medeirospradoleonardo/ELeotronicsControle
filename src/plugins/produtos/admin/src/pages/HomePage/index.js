import React, { memo, useState, useEffect } from "react";
import { LoadingIndicatorPage } from "@strapi/helper-plugin";
import productRequests from "../../api/product";
import {
  BaseHeaderLayout,
  ContentLayout,
} from "@strapi/design-system/Layout";

import {
  rastrearEncomendas,
} from '../../../../correios/lib/index';


import { Box } from '@strapi/design-system/Box';
import PluginTable from "../../components/PluginTable";

import { SimpleMenu, MenuItem } from '@strapi/design-system/SimpleMenu';

const HomePage = (props) => {
  const [filterAll, setFilterAll] = useState(false);
  const [todoData, setTodoData] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  const fetchData = async () => {
    if (isLoading === false) setIsLoading(true);
    let products = await productRequests.getAllProducts();

    products.sort(function (a, b) {
      return a.name - b.name
    });


    if (props.categoryId != 0) {
      products = products.filter((p) => {
        if (p.category.id == props.categoryId) {
          return p
        }
      })
    }

    if(!filterAll){
      products = products.filter((p) => {
        if(!p.delivered){
          return p
        }
      })
    }


    let codRastreio = []; // array de códigos de rastreios
    let rastreios = []; // array de códigos de rastreios

    products.map((product) => {
      if (!product.delivered) {
        codRastreio.push(product.code)
      }
    })


    await rastrearEncomendas(codRastreio).then(response => {
      rastreios = response
    });


    let i = 0
    products.map((product) => {
      if (!product.delivered) {
        if(rastreios[i].eventos[0].descricao == "Objeto em trânsito - por favor aguarde"){
          product['status'] = `De ${rastreios[i].eventos[0].unidade.endereco.cidade}-${rastreios[i].eventos[0].unidade.endereco.uf} para 
                              ${rastreios[i].eventos[0].unidadeDestino.endereco.cidade}-${rastreios[i].eventos[0].unidadeDestino.endereco.uf}`
        }else{
          product['status'] = rastreios[i].eventos[0].descricao
        }
        i++
      } else {
        product['status'] = "Objeto entregue ao destinatário"
      }
    })



    setTodoData(products);
    setIsLoading(false);
  }

  useEffect(async () => {
    await fetchData();
  }, [filterAll])

  async function toggleTodo(data) {
    await todoRequests.toggleTodo(data.id);
  }

  async function deleteTodo(data) {
    await todoRequests.deleteTodo(data.id);
    await fetchData();
  }

  async function editTodo(id, data) {
    await todoRequests.editTodo(id, data);
    await fetchData();
  }

  if (isLoading) return <LoadingIndicatorPage />;

  return (
  

    <Box>
        <>
          <BaseHeaderLayout title={props.categoryName} subtitle={`${todoData.length} produtos`} as="h2" />
          <ContentLayout>

            <SimpleMenu id="label" label={filterAll? "Todos os produtos" : "Somente produtos que ainda não chegaram"}>
              <MenuItem id="menuItem-All" onClick={() => setFilterAll(true)}>
                Todos os produtos
              </MenuItem>
              <MenuItem id="menuItem-NotAll" onClick={() => setFilterAll(false)}>
                Somente produtos que ainda não chegaram
              </MenuItem>
            </SimpleMenu>
            <PluginTable
              todoData={todoData}
              toggleTodo={toggleTodo}
              deleteTodo={deleteTodo}
              editTodo={editTodo}
            />
            {/* <Pagination>
              <PreviousLink as={NavLink} to="/1">
                Previous
              </PreviousLink>
              <PageLink as={NavLink} to="/1">
                1
              </PageLink>
              <PageLink as={NavLink} to="/2">
                2
              </PageLink>
              <NextLink as={NavLink} to="/2">
                Next page
              </NextLink>
            </Pagination> */}

          </ContentLayout>

        </>


    </Box>

  );
};

export default memo(HomePage);
