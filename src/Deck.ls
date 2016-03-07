React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

state_to_props = (state, props) ->
  count: state.get('board').get('cards').get(props.tier.toString!).get('deck').size
  is_highlighted: false

Deck = React.createClass do
  displayName: "Deck"

  propTypes:
    count: V.number.isRequired
    on_click: V.func # for reserving blind
    is_highlighted: V.bool.isRequired

  render: ->
    if @props.count == 0
      return $$.div className: 'card-empty'

    $$.div className: 'card-back', @props.count

module.exports = React.createFactory connect(state_to_props) Deck
