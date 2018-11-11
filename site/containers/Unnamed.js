import {GET_UNNAMED} from 'models/Unnamed'
import PropTypes from 'prop-types'
import {Query} from 'react-apollo'
import React from 'react'

const UnnamedContainer = ({className, display: UnnamedDisplay}) => (
  <Query query={GET_UNNAMED}>
    {({loading, error, data: {game}}) => {
      if (loading) return <div>Loading...</div>
      if (error) return <div>Error!</div>
      return <UnnamedDisplay data={data} className={className} />
    }}
  </Query>
)

UnnamedContainer.propTypes = {
  className: PropTypes.string,
  display: PropTypes.func.isRequired,
}

export default UnnamedContainer
