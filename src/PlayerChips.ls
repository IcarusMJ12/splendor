React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './COLOR_MAP'
require! './PlayerChip'

state_to_props = (state, props) ->
  chips: state.get('players').get(props.index.toString!).get('chips').toJS!

PlayerChips = React.createClass do
  displayName: "PlayerChips"

  propTypes:
    chips: V.array.isRequired

  render: ->
    $$.div className: 'chips',
      [PlayerChip { color: COLOR_MAP[i], key: i, count } for i, count of @props.chips]

module.exports = React.createFactory connect(state_to_props) PlayerChips
