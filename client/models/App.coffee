#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'endPlayerTurn', @dealerTurn # @someCallback
    @get('playerHand').on 'gameIsOver', @checkWinner
    @get('dealerHand').on 'gameIsOver', @checkWinner
    return

  checkWinner: =>
    console.log 'I am inside checkWinner'
    if @get('playerHand').scores()[0] > 21
      console.log 'dealerIsWinner'
      @trigger 'dealerIsWinner', @
    else if @get('dealerHand').scores()[0] > 21
      @trigger 'playerIsWinner', @
      console.log 'playerIsWinner'
    else if @get('playerHand').scores()[0] < @get('dealerHand').scores()[0]
      @trigger 'dealerIsWinner', @
      console.log 'dealerIsWinner'
    else if @get('playerHand').scores()[0] == @get('dealerHand').scores()[0]
      @trigger 'tie', @
    else
      @trigger 'playerIsWinner', @
      console.log 'playerIsWinner'
    return

  dealerTurn: =>
    @get('dealerHand').makeDealerTurn()
    return
