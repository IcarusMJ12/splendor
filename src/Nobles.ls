React = require 'react'
$$ = React.DOM
V = React.PropTypes
{ connect } = require 'react-redux'

require! './Noble'

state_to_props = (state) ->
  count: state.get('board').get('nobles').size

Nobles = React.createClass do
  displayName: "Nobles"

  propTypes:
    count: V.number.isRequired

  render: ->
    $$.div className: 'nobles', [Noble key: i, index: i for i in [0 to @props.count - 1]]

module.exports = React.createFactory connect(state_to_props) Nobles
