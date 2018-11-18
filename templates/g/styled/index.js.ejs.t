---
to: <%= h.src('components', name, 'index.js') %>
---
import cx from 'classnames'
import PropTypes from 'prop-types'
import React from 'react'
import styles from './styles'

const <%= name %> = ({className}) => (
  <div className={cx(className, styles.<%= name %>)}>
    <h2>Component (styled) <%= name %></h2>
  </div>
)

<%= name %>.propTypes = {
  className: PropTypes.string,
}

export default <%= name %>
