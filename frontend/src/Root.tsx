import { useState } from 'react';
import {Container, Group, Burger, MantineProvider, Drawer, ScrollArea, Divider, rem, Button} from '@mantine/core';
import { useDisclosure } from '@mantine/hooks';
import classes from './Root.module.css';
import '@mantine/core/styles.css';
import {Outlet, useLocation, useNavigate} from "react-router-dom";
import {ApolloClient, ApolloProvider, InMemoryCache} from "@apollo/client";

const links = [
  { link: '/', label: 'Home' },
  { link: '/login', label: 'Login' },
  { link: '/another-page', label: 'Another Page' },
];

export default function Root() {
    const [opened, { toggle }] = useDisclosure(false);
    const location = useLocation();
    const [active, setActive] = useState(location.pathname);
    const navigate = useNavigate();
    const client = new ApolloClient({
      uri: import.meta.env.VITE_BACKEND_GRAPHQL_ENDPOINT,
      cache: new InMemoryCache(),
    });

  const items = links.map((link) => (
    <a
      key={link.label}
      href={link.link}
      className={classes.link}
      data-active={active === link.link || undefined}
      onClick={(event) => {
        event.preventDefault();
        setActive(link.link);
        navigate(link.link)
      }}
    >
      {link.label}
    </a>
  ));

  return (
      <ApolloProvider client={client}>
          <MantineProvider>
            <header className={classes.header}>
              <Container size="md" className={classes.inner}>
                Logo
                <Group gap={5} visibleFrom="sm" id={"non-drawer-items"}>
                  {items}
                </Group>

                <Burger opened={opened} onClick={toggle} hiddenFrom="sm" />


                  <Drawer
                    opened={opened}
                    onClose={toggle}
                    size="100%"
                    padding="md"
                    title="Navigation"
                    hiddenFrom="sm"
                    zIndex={1000000}
                  >
                    <ScrollArea h={`calc(100vh - ${rem(80)})`} mx="-md" id={"drawer-scroll-area"}>
                      <Divider my="sm" />

                      {items}

                      <Divider my="sm" />

                      <Group justify="center" grow pb="xl" px="md">
                        <Button variant="default">Log in</Button>
                        <Button>Sign up</Button>
                      </Group>
                    </ScrollArea>
                  </Drawer>
              </Container>
            </header>
            <Container size="md" className={classes.inner}>
              <Outlet/>
            </Container>
          </MantineProvider>
      </ApolloProvider>
  );
}