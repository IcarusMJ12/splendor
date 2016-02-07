# This is a single-player CoffeeScript implementation of Splendor, to be playable
# in your browser.

# Used for its `$(document).ready()` function only at this point.
$ = require 'jquery'
_ = require 'ramda'
React = require 'react'
window.React = React
$$ = React.DOM
V = React.PropTypes
{render} = require 'react-dom'

# Cards and nobles.
data = require '../data/data.json'

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

Noble = React.createFactory React.createClass do
  displayName: "Noble"

  propTypes:
    rgbwb: V.array.isRequired
    vp: V.number.isRequired
    on_click: V.func # you may need to click this if having a choice between two nobles

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

$ ->
  {cards, nobles} = data
  rows = []
  rows.push $$.div key: 'nobles', className: 'row', [Noble(_.merge noble, key: i) for noble, i in nobles]
  for i, tier of cards
    rows.push $$.div key: i, className: 'row', [Card(_.merge card, key: j) for card, j in tier]
  render $$.div(null, rows), $('#main')[0]
