# this component is IMPURE -- it only knows the player count, but its children
# care about the actual player details and may need to rerender correspondingly

React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './Player'

state_to_props = (state) ->
  count: state.get('players').size - 1

Players = React.createClass do
  displayName: "Players"

  propTypes:
    count: V.number.isRequired

  render: ->
    $$.div className: 'players', [Player key: i, index: i for i in [0 to @props.count - 1]]

module.exports = React.createFactory connect(state_to_props) Players
