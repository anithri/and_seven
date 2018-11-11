import App from 'containers/App'
import React from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('appWrapper')
  const rawData = Object.assign({},node.dataset).raw
  const initialState = JSON.parse(rawData)
  ReactDOM.render(<App initialState={initialState} />, node)
})
