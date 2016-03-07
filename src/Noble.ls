_ = require 'lodash/fp'

React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './COLOR_MAP'

{ Cost, VP } = require './ui'

state_to_props = (state, props) ->
  _.merge is_highlighted: false, #TODO
    state.get('board').get('nobles').get(props.index).toJS!

Noble = React.createClass do
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

module.exports = React.createFactory connect(state_to_props) Noble
