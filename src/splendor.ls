# This is a single-player LiveScript implementation of Splendor, to be playable
# in your browser.

$ = require 'jquery'
React = require 'react'
$$ = React.DOM
{ render } = require 'react-dom'
{ createStore } = require 'redux'
Provider = React.createFactory require('react-redux').Provider

require! './reducer'
require! './Players'
require! './Board'
{ new_game } = require './actions'

Splendor = React.createFactory React.createClass do
  displayName: "Splendor"

  render: ->
    $$.div null, Players!, Board!

$ ->
  store = createStore reducer
  store.dispatch new_game Date.now!
  render (Provider { store }, Splendor!), $('#root')[0]
