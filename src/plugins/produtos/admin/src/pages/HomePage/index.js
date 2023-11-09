"use strict";
import React, { memo, useState, useEffect } from "react";
import { LoadingIndicatorPage } from "@strapi/helper-plugin";
import productRequests from "../../api/product";
import {
  BaseHeaderLayout,
  ContentLayout,
} from "@strapi/design-system/Layout";

import { Box } from '@strapi/design-system/Box';
import PluginTable from "../../components/PluginTable";

import { SimpleMenu, MenuItem } from '@strapi/design-system/SimpleMenu';

const HomePage = (props) => {
  const [filterAll, setFilterAll] = useState(false);
  const [filterDelivered, setFilterDelivered] = useState(false);
  const [filterNoBuyer, setFilterNoBuyer] = useState(false);
  const [productsData, setProductsData] = useState([]);
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

    if (!filterAll) {
      if (!filterDelivered) {
        products = products.filter((p) => {
          if (!p.delivered) {
            return p
          }
        })
      }

      if (filterNoBuyer) {
        products = products.filter((p) => {
          if (p.nameBuyer == null) {
            return p
          }
        })

        if (filterDelivered) {
          products = products.filter((p) => {
            if (p.delivered) {
              return p
            }
          })
        }
      }
    }



    let codRastreio = []; // array de códigos de rastreios
    let rastreios = []; // array de códigos de rastreios

    products.map((product) => {
      if (!product.delivered) {
        if (product.code) {
          codRastreio.push(product.code)
        }
      }
    })

    if (codRastreio.length > 0) {
      rastreios = await productRequests.tracking(codRastreio);
    }

    let i = 0
    products.map((product) => {
      if (!product.delivered) {
        if (rastreios[i].eventos != null) {
          product['status'] = rastreios[i].eventos[0].descricao
          if (product['status'] == "Objeto entregue ao destinatário") {
            delivered(product)
          }
        } else {
          product['status'] = "Objeto não encontrado"
        }
        i++
      } else {
        product['status'] = "Objeto entregue ao destinatário"
      }
    })




    setProductsData(products);
    setIsLoading(false);
  }


  async function delivered(data) {
    await productRequests.delivered(data.id);
  }

  function getLabel() {
    if (filterAll) {
      return "Todos os produtos"
    } else if (!filterDelivered && !filterNoBuyer) {
      return "Somente produtos que ainda não chegaram"
    } else {
      return "Somente produtos que chegaram e nao têm comprador"
    }
  }

  useEffect(async () => {
    await fetchData();
  }, [filterAll, filterDelivered, filterNoBuyer])

  if (isLoading) return <LoadingIndicatorPage />;

  return (


    <Box>
      <>
        <BaseHeaderLayout title={props.categoryName} subtitle={`${productsData.length} produtos`} as="h2" />
        <ContentLayout>
          {/* {productsData[0].image != null? <img style={{
            height: "700px",
            width: "500px"
          }} src={productsData[0].image[0].url}/> : <></>}
            Como mostrar imagem
          */}

          <SimpleMenu id="label" label={getLabel()}>
            <MenuItem id="menuItem-All" onClick={function filter() {
              setFilterAll(true)
              setFilterDelivered(true)
              setFilterNoBuyer(false)
            }}>
              Todos os produtos
            </MenuItem>
            <MenuItem id="menuItem-NotAll" onClick={function filter() {
              setFilterAll(false)
              setFilterDelivered(false)
              setFilterNoBuyer(false)
            }}>
              Somente produtos que ainda não chegaram
            </MenuItem>
            <MenuItem id="menuItem-NotAll" onClick={function filter() {
              setFilterAll(false)
              setFilterDelivered(true)
              setFilterNoBuyer(true)
            }}>
              Somente produtos que chegaram e nao têm comprador
            </MenuItem>
          </SimpleMenu>
          <PluginTable
            productsData={productsData}
          />
        </ContentLayout>
      </>


    </Box>

  );
};

export default HomePage;
