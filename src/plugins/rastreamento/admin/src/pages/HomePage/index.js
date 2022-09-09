import React, { useState } from 'react';
import pluginId from '../../pluginId';
import styled from 'styled-components'
import { TextButton } from '@strapi/design-system/TextButton';
import { Box } from '@strapi/design-system/Box';
import { Avatar } from '@strapi/design-system/Avatar';
import { IconButton } from '@strapi/design-system/IconButton';
import { Flex } from '@strapi/design-system/Flex';
import { Typography } from '@strapi/design-system/Typography';
import { BaseCheckbox } from '@strapi/design-system/BaseCheckbox';
import { Table, Thead, Tbody, Tr, Td, Th } from '@strapi/design-system/Table';
import Pencil from '@strapi/icons/Pencil';
import Trash from '@strapi/icons/Trash';
import ExclamationMarkCircle from '@strapi/icons/ExclamationMarkCircle';
import Apps from '@strapi/icons/Apps';
import Plus from '@strapi/icons/Plus';
import {
  calcularPrecoPrazo,
  consultarCep,
  rastrearEncomendas,
} from 'correios-brasil';

import {
  SubNav,
  SubNavHeader,
  SubNavSection,
  SubNavSections,
  SubNavLink,
  SubNavLinkSection,
} from '@strapi/design-system/SubNav';

const HomePage = () => {

  let codRastreio = ['LB549436421HK', 'LB549444034HK', 'LB549431968HK', 'LB549431971HK', 'LB549432963HK', 'LB549441395HK', 'LB549440488HK']; // array de códigos de rastreios

  rastrearEncomendas(codRastreio).then(response => {
    console.log(response);
  });

  const links = [{
    id: 1,
    label: 'Addresses',
    icon: <ExclamationMarkCircle />,
    to: '/address'
  }, {
    id: 2,
    label: 'Categories',
    to: '/category'
  }, {
    id: 3,
    label: 'Cities',
    icon: <Apps />,
    to: '/city',
    active: true
  }, {
    id: 4,
    label: 'Countries',
    to: '/country'
  }];

  const ROW_COUNT = 6;
  const COL_COUNT = 10;
  const entry = {
    cover: 'https://avatars.githubusercontent.com/u/3874873?v=4',
    description: 'Chez Léon is a human sized Parisian',
    category: 'French cuisine',
    contact: 'Leon Lafrite'
  };
  const entries = [];

  for (let i = 0; i < 5; i++) {
    entries.push({
      ...entry,
      id: i
    });
  }

  return <Flex>
    <Box style={{
      height: '100vh'
    }} background="neutral200">
      <SubNav ariaLabel="Builder sub nav">
        <SubNavHeader label="Produtos" />
        <SubNavSections>
          <SubNavSection label="Categorias" collapsable badgeLabel={links.length.toString()}>
            {links.map(link => <SubNavLink to={link.to} active={link.active} key={link.id}>
              {link.label}
            </SubNavLink>)}
          </SubNavSection>
        </SubNavSections>
      </SubNav>
    </Box>

    <Box padding={8} background="neutral100">
      <Table colCount={COL_COUNT} rowCount={ROW_COUNT}>
        <Thead>
          <Tr>
            <Th>
              <BaseCheckbox aria-label="Select all entries" />
            </Th>
            <Th>
              <Typography variant="sigma">ID</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Cover</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Description</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Categories</Typography>
            </Th>
            <Th>
              <Typography variant="sigma">Contact</Typography>
            </Th>
            <Th>
              Actions
            </Th>
          </Tr>
        </Thead>
        <Tbody>
          {entries.map(entry => <Tr key={entry.id}>
            <Td>
              <BaseCheckbox aria-label={`Select ${entry.contact}`} />
            </Td>
            <Td>
              <Typography textColor="neutral800">{entry.id}</Typography>
            </Td>
            <Td>
              <Avatar src={entry.cover} alt={entry.contact} />
            </Td>
            <Td>
              <Typography textColor="neutral800">{entry.description}</Typography>
            </Td>
            <Td>
              <Typography textColor="neutral800">{entry.category}</Typography>
            </Td>
            <Td>
              <Typography textColor="neutral800">{entry.contact}</Typography>
            </Td>
            <Td>
              <Flex>
                <IconButton onClick={() => console.log('edit')} label="Edit" noBorder icon={<Pencil />} />
                <Box paddingLeft={1}>
                  <IconButton onClick={() => console.log('delete')} label="Delete" noBorder icon={<Trash />} />
                </Box>
              </Flex>
            </Td>
          </Tr>)}
        </Tbody>
      </Table>
    </Box>
  </Flex>
};

export default HomePage;
