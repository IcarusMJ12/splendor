React = require 'react'
$$ = React.DOM
V = React.PropTypes

module.exports = React.createFactory React.createClass do
  displayName: "PlayerChip"

  propTypes:
    color: V.string.isRequired
    count: V.number.isRequired

  render: ->
    $$.div className: 'chip ' + @props.color, @props.count
