import { gql } from 'apollo-server-koa';

export default gql`
type User {
  id: ID!
  username: String!
}

type Query {
  users: [User]
}

schema {
  query: Query
}
`;
