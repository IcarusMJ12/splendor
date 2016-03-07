React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

state_to_props = (state, props) ->
  reserved: state.get('players').get(props.index.toString!).get('reserved')

PlayerReserved = React.createClass do
  displayName: "PlayerReserved"

  propTypes:
    reserved: V.object.isRequired

  render: ->
    # TODO: maybe show cards
    $$.div className: 'reserved', @props.reserved.size

module.exports = React.createFactory connect(state_to_props) PlayerReserved
