import React, { useState } from "react";
import {
  Table,
  Thead,
  TFooter,
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
import { VisuallyHidden } from "@strapi/design-system/VisuallyHidden";
import { BaseCheckbox } from "@strapi/design-system/BaseCheckbox";
import { TextInput } from "@strapi/design-system/TextInput";
import Pencil from "@strapi/icons/Pencil";
import Trash from "@strapi/icons/Trash";
import Plus from "@strapi/icons/Plus";
import { useHistory, useLocation } from 'react-router-dom';

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
  productsData,
  setShowModal,
}) {
  const { push } = useHistory();

  const handleGoTo = to => {
    push(`/content-manager/collectionType/plugin::produtos.product/${to}`);
  };

  return (
    <Box
    // background="neutral0"
    // hasRadius={true}
    // shadow="filterShadow"
    // padding={8}
    // style={{ marginTop: "10px" }}
    >
      <Table
        colCount={4}
        rowCount={10}
      // footer={
      //   <TFooter onClick={() => setShowModal(true)} icon={<Plus />}>
      //     Add a todo
      //   </TFooter>
      // }
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
                    <Flex>
                      <IconButton
                        onClick={() => {
                          handleGoTo(product.id);
                        }}
                        label="Edit"
                        noBorder
                        icon={<Pencil />}
                      />

                      {/* <Box paddingLeft={1}>
                        <IconButton
                          onClick={() => deleteTodo(product)}
                          label="Delete"
                          noBorder
                          icon={<Trash />}
                        />
                      </Box> */}
                    </Flex>
                  
                </Td>
              </Tr>
            );
          })}
        </Tbody>
      </Table>
    </Box>
  );
}