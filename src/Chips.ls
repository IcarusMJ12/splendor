React = require 'react'
$$ = React.DOM

require! './COLOR_MAP'

require! './Chip'

module.exports = React.createFactory React.createClass do
  displayName: "Chips"

  render: ->
    $$.div className: 'chips',
      [Chip key: i, index: i, color: COLOR_MAP[i] for i in [0 to 5]]
