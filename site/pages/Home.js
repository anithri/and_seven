import {gql} from 'apollo-boost'
import {Link} from 'react-router-dom'
import PropTypes from 'prop-types'
import {Query} from 'react-apollo'
import React from 'react'
import {GET_USER_DATA} from 'models/UserData'

class HomePage extends React.Component {
  render() {
    const {children, className} = this.props
    return (
      <Query query={GET_USER_DATA}>
        {({data, error, loading}) => {
          if (error) return 'Error'
          if (loading) return 'Loading'
          const user = data.user
          return (
            <div id="homePage" className={`pageWrapper ${className}`}>
              {children}
              <main>
                <h1>Hiya</h1>
                <p>How are you?</p>
                <a href="/logout" data-method="delete">
                  Logout {user.name}
                </a>
              </main>
            </div>
          )
        }}
      </Query>
    )
  }
}

HomePage.propTypes = {
  children: PropTypes.node,
  className: PropTypes.string,
}

export default HomePage
