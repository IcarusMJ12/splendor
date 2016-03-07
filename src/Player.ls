React = require 'react'
$$ = React.DOM
V = React.PropTypes

require! './PlayerVPs'
require! './PlayerReserved'
require! './PlayerProduction'
require! './PlayerChips'

module.exports = React.createFactory React.createClass do
  displayName: "Player"

  propTypes:
    index: V.number.isRequired

  render: ->
    { index } = @props

    $$.div className: 'player',
      $$.div className: 'col',
        $$.div className: 'name', 'P' + index.toString!
        PlayerVPs { index }
      $$.div className: 'col',
        PlayerProduction { index }
        PlayerReserved { index }
      $$.div className: 'col',
        PlayerChips { index }
