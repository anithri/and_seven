import {gql} from 'apollo-boost'

export const GET_USER_DATA = gql`
  query {
    user {
      name
    }
  }
`
