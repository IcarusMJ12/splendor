React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './Deck'
require! './Card'

state_to_props = (state, props) ->
  count: state.get('board').get('cards').get(props.tier.toString!).get('visible').size

CardRow = React.createClass do
  displayName: "CardRow"

  propTypes:
    tier: V.number.isRequired
    count: V.number.isRequired

  render: ->
    cards = [Deck key: 'deck', tier: @props.tier]
    cards = cards.concat [Card key: i, index: i, tier: @props.tier for i in [0 to @props.count - 1]]
    $$.div className: 'card-row', cards

module.exports = React.createFactory connect(state_to_props) CardRow
