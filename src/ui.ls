React = require 'react'
$$ = React.DOM
V = React.PropTypes

# Card and noble colors are stored in an array called `rgbwb`, corresponding to:
COLOR_MAP = [ 'red', 'green', 'blue', 'white', 'black' ]

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

Card = React.createFactory React.createClass do
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

Deck = React.createFactory React.createClass do
  displayName: "Deck"

  propTypes:
    count: V.number.isRequired
    on_click: V.func # for reserving blind
    is_highlighted: V.bool.isRequired

  render: ->
    if @props.count == 0
      return $$.div className: 'card-empty'

    $$.div className: 'card-back', @props.count

Noble = React.createFactory React.createClass do
  displayName: "Noble"

  propTypes:
    rgbwb: V.array.isRequired
    vp: V.number.isRequired
    on_click: V.func # you may need to click this if having a choice between two nobles
    is_highlighted: V.bool.isRequired

  render: ->
    reqs =
      [Cost color: COLOR_MAP[i], count: count for count, i in @props.rgbwb when count > 0]
    while reqs.length < 3
      reqs.push $$.div key: reqs.length, className: 'element'

    $$.div className: 'noble',
      $$.div className: 'table-row',
        $$.div className: 'element'
        $$.div className: 'element'
        VP count: @props.vp
      $$.div className: 'table-row', ...reqs

CardRow = React.createFactory React.createClass do
  displayName: "CardRow"

  propTypes:
    children: V.array.isRequired

  render: ->
    $$.div className: 'row', @props.children

Chip = React.createFactory React.createClass do
  displayName: "Chip"

  propTypes:
    color: V.string.isRequired
    count: V.number.isRequired

  render: ->
    $$.div className: 'chip ' + @props.color, @props.count

module.exports = { Cost, Production, VP, Card, Deck, Noble, CardRow }
