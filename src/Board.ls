React = require 'react'
$$ = React.DOM

require! './Chips'
require! './Nobles'
require! './CardRow'

module.exports = React.createFactory React.createClass do
  displayName: "Board"

  render: ->
    $$.div className: 'board',
      Chips!
      Nobles!
      CardRow tier: 3
      CardRow tier: 2
      CardRow tier: 1
