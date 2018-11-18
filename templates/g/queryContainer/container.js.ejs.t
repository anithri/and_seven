---
to: <%= h.src('containers', Name, '.js') %>
---
import {GET_<%= Name.toUpperCase() %>} from 'models/<%= Name %>'
import PropTypes from 'prop-types'
import {Query} from 'react-apollo'
import React from 'react'

const <%= Name %>Container = ({className, display: <%= Name %>Display}) => (
  <Query query={GET_<%= Name.toUpperCase() %>}>
    {({loading, error, data: {game}}) => {
      if (loading) return <div>Loading...</div>
      if (error) return <div>Error!</div>
      return <<%= Name %>Display data={data} className={className} />
    }}
  </Query>
)

<%= Name %>Container.propTypes = {
  className: PropTypes.string,
  display: PropTypes.func.isRequired,
}

export default <%= Name %>Container
