_ = require 'lodash/fp'

React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

{ Cost, VP, Production } = require './ui'

require! './COLOR_MAP'

state_to_props = (state, props) ->
  card = state.get('board').get('cards').get(props.tier.toString!).get('visible').get(props.index)
  _.merge is_highlighted: false, card.toJS!

Card = React.createClass do
  displayName: "Card"

  propTypes:
    production: V.number.isRequired
    rgbwb: V.array.isRequired
    vp: V.number.isRequired
    on_click: V.func
    is_highlighted: V.bool.isRequired

  render: ->
    costs =
      [Cost color: COLOR_MAP[i], count: count for count, i in @props.rgbwb when count > 0]
    while costs.length < 4
      costs.push $$.div key: costs.length, className: 'element'

    $$.div className: 'card',
      $$.div className: 'table-row',
        VP count: @props.vp
        $$.div className: 'element'
        $$.div className: 'element'
        Production color: COLOR_MAP[@props.production]
      $$.div className: 'table-row', ...costs

module.exports = React.createFactory connect(state_to_props) Card
