React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

state_to_props = (state, props) ->
  count: state.get('board').get('chips').get(props.index).toString!
  is_highlighted: false #TODO

Chip = React.createClass do
  displayName: "Chip"

  propTypes:
    color: V.string.isRequired
    count: V.string.isRequired
    is_highlighted: V.bool.isRequired
    on_click: V.func

  render: ->
    $$.div className: 'chip ' + @props.color, @props.count

module.exports = React.createFactory connect(state_to_props) Chip
