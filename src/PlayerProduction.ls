React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './COLOR_MAP'
{ Cost } = require './ui'

state_to_props = (state, props) ->
  cards = state.get('players').get(props.index.toString!).get('cards').toJS!
  rgbwb = [0] * 5
  for card in cards
    rgbwb[card.production] += 1

  { rgbwb }

PlayerProduction = React.createClass do
  displayName: "PlayerProduction"

  propTypes:
    rgbwb: V.array.isRequired

  render: ->
    $$.div className: 'production',
      [Cost { color: COLOR_MAP[i], key: i, count } for i, count of @props.rgbwb]

module.exports = React.createFactory connect(state_to_props) PlayerProduction
