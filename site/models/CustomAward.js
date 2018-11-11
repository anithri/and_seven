import {gql} from 'apollo-boost'
import PropTypes from 'prop-types'

export const GET_CUSTOM_AWARD_DATA = gql`
  query {
    customAwards {
      title
      category
      description
      editable
      id
    }
  }
`

export const CustomAwardShape = PropTypes.shape({
  id: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  category: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  editable: PropTypes.bool,
})

export const CustomAwardCollection = PropTypes.arrayOf(CustomAwardShape)

