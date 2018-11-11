import cx from 'classnames'
import PropTypes from 'prop-types'
import React from 'react'
import styles from './styles.module.css'
import {CustomAwardCollection} from 'models/CustomAward'
import Row from './Row'

const CustomAwardsTable = ({className, customAwards}) => {
  console.log(customAwards)
  const rows = customAwards.map(award => <Row rowData={award} />)
  return (
    <table className={cx(className, styles.CustomAwardsTable)}>
      <tbody>{rows}</tbody>
    </table>
  )
}

CustomAwardsTable.propTypes = {
  className: PropTypes.string,
  customAwards: CustomAwardCollection,
}

export default CustomAwardsTable
