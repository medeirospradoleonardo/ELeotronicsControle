import React, { useState } from "react";
import {
  Table,
  Thead,
  Tbody,
  Tr,
  Td,
  Th,
} from "@strapi/design-system/Table";
import { Box } from "@strapi/design-system/Box";
import { Flex } from "@strapi/design-system/Flex";
import { Button } from "@strapi/design-system/Button";
import { Typography } from "@strapi/design-system/Typography";
import { IconButton } from "@strapi/design-system/IconButton";
import { BaseCheckbox } from "@strapi/design-system/BaseCheckbox";
import { TextInput } from "@strapi/design-system/TextInput";
import Pencil from "@strapi/icons/Pencil";
import PicturePlus from '@strapi/icons/PicturePlus';

import { useHistory, useLocation } from 'react-router-dom';
import { ModalLayout, ModalBody, ModalHeader, ModalFooter } from '@strapi/design-system/ModalLayout';
import productRequests from "../../api/product";
import ReactPanZoom from 'react-image-pan-zoom-rotate';

function TodoCheckbox({ value, checkboxID, callback, disabled }) {
  const [isChecked, setIsChecked] = useState(value);

  function handleChange() {
    setIsChecked(!isChecked);
    {
      callback && callback({ id: checkboxID, value: !isChecked });
    }
  }

  return (
    <BaseCheckbox
      checked={isChecked}
      onChange={handleChange}
      disabled={disabled}
    />
  );
}

function TodoInput({ value, onChange }) {
  return (
    <TextInput
      type="text"
      aria-label="todo-input"
      name="todo-input"
      error={value.length > 40 ? "Text should be less than 40 characters" : ""}
      onChange={onChange}
      value={value}
    />
  );
}

export default function TodoTable({
  productsData
}) {
  const { push } = useHistory();
  const [isVisible, setIsVisible] = useState(false);
  const [productModal, setProductModal] = useState(null);

  async function setProduct(productIdModal) {
    let p = await productRequests.getProduct(productIdModal)

    setProductModal(p)
    setIsVisible(prev => !prev)
  }

  const handleGoTo = to => {
    push(`/content-manager/collectionType/plugin::produtos.product/${to}`);
  };

  return (
    <Box>
      <Table
        colCount={4}
        rowCount={10}
      >
        <Thead>
          <Tr>
            <Th>
              <Typography variant="sigma">ID</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Nome</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Status</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Recebedor</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Local</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Comprador</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Código de Rastreio</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Ações</Typography>
            </Th>
          </Tr>
        </Thead>

        <Tbody>
          {productsData.map((product) => {

            const [inputValue, setInputValue] = useState(product.name);

            const [isEdit, setIsEdit] = useState(false);

            return (
              <Tr key={product.id}>
                <Td>
                  <Typography textColor="neutral800">{product.name}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.category.name}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.status}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.nameReceiver}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.local}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.nameBuyer}</Typography>
                </Td>
                <Td>
                  <Typography textColor="neutral800">{product.code}</Typography>
                </Td>

                <Td>
                  <Flex justifyContent="start">
                    <Box>
                      <IconButton
                        onClick={() => {
                          handleGoTo(product.id);
                        }}
                        label="Edit"
                        noBorder
                        icon={<Pencil />}
                      />
                    </Box>
                    <Box>
                      <IconButton
                        onClick={function func() {
                          setProduct(product.id)
                        }}
                        label="Imagem"
                        noBorder
                        icon={<PicturePlus />}
                      />

                    </Box>
                  </Flex>

                </Td>
              </Tr>
            );
          })}
        </Tbody>
      </Table>
      {isVisible && <ModalLayout onClose={() => setIsVisible(prev => !prev)} labelledBy="title">
        <ModalHeader>
          <Typography fontWeight="bold" textColor="neutral800" as="h2" id="title">
            {`Imagem do ${productModal.category.name} ${productModal.name}`}
          </Typography>
        </ModalHeader>
        <ModalBody>
            {productModal.image != null ?
            <ReactPanZoom
            image={productModal.image[0].url} 
            alt={`Imagem do ${productModal.category.name} ${productModal.name}`}
          /> : <></>}
        </ModalBody>
        <ModalFooter endActions={<>
          <Button onClick={() => setIsVisible(prev => !prev)}>Fechar</Button>
        </>} />
      </ModalLayout>}
    </Box>
  );
}