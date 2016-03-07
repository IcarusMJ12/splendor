{ Map } = require 'immutable'
{ Chance } = require 'chance'
{ fromJS } = require 'immutable'

data = fromJS require '../data/data.json'

reducers =
  NEW_GAME: (state = Map!, payload) ->
    ch = new Chance payload
    { cards, nobles } = data.toJS!
    # at the moment only doing a 3 player game
    # TODO: add game configuration
    for i of cards
      cards[i] = ch.shuffle cards[i]

    result =
      players:
        0: cards: [], reserved: [], chips: [0] * 6, nobles: []
        1: cards: [], reserved: [], chips: [0] * 6, nobles: []
        2: cards: [], reserved: [], chips: [0] * 6, nobles: []
        current_player: ch.integer min: 0, max: 2
      board:
        chips: [5] * 6
        nobles: ch.shuffle(nobles)[0 to 3]
        cards:
          { [i, deck: tier[4 to tier.length], visible: tier[0 to 3]] for i, tier of cards }

    fromJS result

  TAKE_CHIP: (state = Map!, payload) ->
    return state

  RETURN_CHIP: (state = Map!, payload) ->
    return state

  BUY_CARD: (state = Map!, payload) ->
    return state

  RESERVE_CARD: (state = Map!, payload) ->
    return state

  CLAIM_NOBLE: (state = Map!, payload) ->
    return state

module.exports = (state = Map!, action) ->
  if action.type not of reducers
    return state

  reducers[action.type](state, action.payload)
