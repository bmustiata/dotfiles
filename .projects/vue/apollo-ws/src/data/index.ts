import gql from 'graphql-tag';
import { ApolloClient } from 'apollo-client';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { WebSocketLink } from 'apollo-link-ws';
import { onError } from 'apollo-link-error';
import { ApolloLink } from 'apollo-link';
import { SubscriptionClient } from 'subscriptions-transport-ws';


export class Domain {
  host: String = '';

  constructor(host: String) {
    this.host = host;
  }
}

export class Model {
  domains: Array<Domain> = []
}

export const model = new Model();


const GRAPHQL_ENDPOINT = 'ws://localhost:8000/graphql';

const subscriptionClient = new SubscriptionClient(GRAPHQL_ENDPOINT, {
  reconnect: true,
});

const link = new WebSocketLink(subscriptionClient);


const client = new ApolloClient({
  link: ApolloLink.from([
    onError(({ graphQLErrors, networkError }) => {
      if (graphQLErrors) {
        graphQLErrors.forEach(({ message, locations, path }) => {
          console.log(`[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`);
        });
      }

      if (networkError) {
        console.log(`[Network error]: ${networkError}`);
      }
    }),
    link,
  ]),
  cache: new InMemoryCache(),
});


async function fetchData() {
  const data = await client.query({
    query: gql`
      query {
        domains {
          host
        }
      }`,
  });

  data.data.domains.forEach(it => model.domains.push(it));
}

const x = client.subscribe({
  query: gql`
    subscription Subscription {
      counter
    }
  `,
});


fetchData();

x.subscribe({
  next(value) {
    console.log(`got value ${value}`);
    console.log(value.data.counter);
  },
});
