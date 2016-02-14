# This is a single-player CoffeeScript implementation of Splendor, to be playable
# in your browser.

$ = require 'jquery'
_ = require 'lodash/fp'
{ fromJS } = require 'immutable'
React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ render } = require 'react-dom'
{ createStore } = require 'redux'
{ connect, Provider } = require 'react-redux'
Provider = React.createFactory Provider

{ Card, Deck, Noble, CardRow } = require './ui'
require! './reducer'
{ new_game } = require './actions'

state_to_props = (state) ->
  nobles: state.get('board').get('nobles').toJS!
  cards: state.get('board').get('cards').toJS!
Splendor = React.createClass do
  displayName: Splendor

  propTypes:
    nobles: V.array.isRequired
    cards: V.object.isRequired

  render: ->
    rows = []
    rows.push CardRow key: 'nobles', children: @props.nobles.map (noble, i) ->
      Noble _.merge key: i, is_highlighted: false, noble
    for i, tier of @props.cards
      children = [Deck key: 'deck', is_highlighted: false, count: tier.deck.length]
      children = children.concat tier.visible.map (card, j) ->
        Card _.merge key: j, is_highlighted: false, card
      rows.push CardRow { key: i, children }
    $$.div null, rows
Splendor = React.createFactory connect(state_to_props)(Splendor)

$ ->
  store = createStore reducer
  store.dispatch new_game Date.now!
  render (Provider { store }, Splendor!), $('#root')[0]
