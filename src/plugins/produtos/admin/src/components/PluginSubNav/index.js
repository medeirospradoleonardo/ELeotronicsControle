import React, { useState } from 'react';
import { Box } from '@strapi/design-system/Box';
import {
  SubNav,
  SubNavHeader,
  SubNavSection,
  SubNavSections,
  SubNavLink
} from '@strapi/design-system/SubNav';
import pluginId from '../../pluginId';

export default function TodoBox({
  links
}) {
  return (
    <Box style={{
      height: '100vh',
    }} background="neutral200">
      <SubNav ariaLabel="dawd">
        <SubNavHeader label="Produtos" />
        <SubNavSections>
          <SubNavSection label="Categorias" collapsable badgeLabel={links.length.toString()}>
            {links.map(link => <SubNavLink to={`/plugins/${pluginId}/${link.label.replace(" ", "")}`} className={link.active? 'active' : ''} active={link.active} key={link.id}>
              {link.label}
            </SubNavLink>)}
          </SubNavSection>
        </SubNavSections>
      </SubNav>
    </Box>

    
  )

}

