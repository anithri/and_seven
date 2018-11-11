import React from 'react'

const Row = ({rowData, className}) => (
    <tr className={className}>
      <td>{rowData.title}</td>
      <td>{rowData.category}</td>
      <td>{rowData.editable ? 'Editable' : 'Uneditable'}</td>
    </tr>
)

export default Row
