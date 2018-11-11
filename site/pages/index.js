import { Route, BrowserRouter as Router } from 'react-router-dom'
import Home from './Home'
import PropTypes from 'prop-types'
import React from 'react'
const SiteRouter = ({ className }) => {
  return (
    <Router>
      <div className={className}>
        <Route exact path="/" component={Home} />
      </div>
    </Router>
  )
}

SiteRouter.propTypes = {
  className: PropTypes.string.isRequired,
}
export default SiteRouter
