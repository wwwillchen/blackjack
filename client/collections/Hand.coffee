class window.Hand extends Backbone.Collection

  model: Card


  initialize: (array, @deck, @isDealer) ->
    # if @isDealer
    #   @isMyTurn = false
    # else
    #   @isMyTurn = true

  hit: ->
    # debugger
    @add(@deck.pop()).last()
    @checkScore()
    return

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

    #if the hand collection (add, remove) -> check score

  checkScore: ->
    console.log 'isDealer = ', @isDealer, 'score = ',  @scores()[0]
    if @scores()[0] > 21
      console.log 'gameIsOver from > 21'
      @trigger 'gameIsOver', @
    else if @scores()[0] == 21 and @isDealer
      console.log 'gemaIsOver from ='
      @trigger 'gameIsOver', @
    else if @scores()[0] == 21 and !@isDealer
      @stand()
    return

  makeDealerTurn: ->
    if @scores()[0] < 17
      @hit()
      @makeDealerTurn()
    else if @scores()[0] < 21
      @trigger 'gameIsOver', @
    return

  stand: ->
    @trigger 'endPlayerTurn', @
    return
