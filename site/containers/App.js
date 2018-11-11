import 'styles/application'
import ApolloClient from 'apollo-boost'
import {ApolloProvider} from 'react-apollo'
import Pages from 'pages'
import React from 'react'
import {Helmet as ReactHelmet} from 'react-helmet'

const client = new ApolloClient({
  fetchOptions: {
    credentials: 'same-origin',
  },
  request: operation => {
    const csrfToken = document.querySelector('meta[name=csrf-token]').getAttribute('content')

    operation.setContext({
      headers: {'X-CSRF-Token': csrfToken},
    })
  },
  uri: 'http://localhost:3000/graphql',
})

class App extends React.Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <Pages className="max">
          <ReactHelmet>
            <meta charSet="utf-8" />
            <title>Badger - Internal Projects</title>
          </ReactHelmet>
        </Pages>
      </ApolloProvider>
    )
  }
}

export default App
