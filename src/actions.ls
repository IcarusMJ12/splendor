module.exports =
  new_game: (seed) ->
    type: 'NEW_GAME'
    payload: seed

  take_chip: (color) ->
    type: 'TAKE_CHIP'
    payload: color

  return_chip: (color) ->
    type: 'RETURN_CHIP'
    payload: color

  # row 0 is reserved cards
  buy_card: (row, index) ->
    type: 'BUY_CARD'
    payload: {row, index}

  # index -1 is deck
  reserve_card: (row, index) ->
    type: 'RESERVE_CARD'
    payload: {row, index}

  claim_noble: (index) ->
    type: 'CLAIM_NOBLE'
    payload: index
