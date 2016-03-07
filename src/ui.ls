React = require 'react'
$$ = React.DOM
V = React.PropTypes

require! './COLOR_MAP'

Cost = React.createFactory React.createClass do
  displayName: "Cost"

  propTypes:
    color: V.string.isRequired
    count: V.number.isRequired

  render: ->
    $$.div className: 'cost ' + @props.color, @props.count

Production = React.createFactory React.createClass do
  displayName: "Production"

  propTypes:
    color: V.string.isRequired

  render: ->
    $$.div className: 'production ' + @props.color

VP = React.createFactory React.createClass do
  displayName: "VP"

  propTypes:
    count: V.number.isRequired

  render: ->
    $$.div className: 'vp', (@props.count or '')

module.exports = { Cost, Production, VP }
