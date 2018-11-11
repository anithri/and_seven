import {GET_CUSTOM_AWARD_DATA} from 'models/CustomAward'
import PropTypes from 'prop-types'
import {Query} from 'react-apollo'
import React from 'react'
import CustomAwardsTable from 'components/CustomAwardsTable'

const CustomAwardsContainer = ({className}) => (
  <Query query={GET_CUSTOM_AWARD_DATA}>
    {({loading, error, data: {customAwards}}) => {
      if (loading) return <div>Loading...</div>
      if (error) return <div>Error!</div>
      return <CustomAwardsTable customAwards={customAwards} className={className} />
    }}
  </Query>
)

CustomAwardsContainer.propTypes = {
  className: PropTypes.string,
}

export default CustomAwardsContainer
