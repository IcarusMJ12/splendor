_ = require 'lodash/fp'
React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

state_to_props = (state, props) ->
  cards = state.get('players').get(props.index.toString!).get('cards').toJS!

  count: _.sum [card.get('vp') for card in cards]

PlayerVPs = React.createClass do
  displayName: "PlayerVPs"

  propTypes:
    count: V.number.isRequired

  render: ->
    $$.div className: 'vps',
      $$.div className: 'five-star'
      $$.div className: 'vps-count', @props.count

module.exports = React.createFactory connect(state_to_props) PlayerVPs
