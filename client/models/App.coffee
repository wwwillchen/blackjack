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
    debugger
    if @get('playerHand').scores()[0] > 21
      console.log 'dealer Winner (player over 21)'
      @trigger 'dealerIsWinner', @
    else if @get('dealerHand').scores()[0] > 21 #ISSUE
      console.log 'player Winner (dealer over 21)'
      @trigger 'playerIsWinner', @
    else if @get('playerHand').scores()[0] < @get('dealerHand').scores()[0]
      console.log 'dealer Winner (dealer higher score)'
      @trigger 'dealerIsWinner', @
    else if @get('playerHand').scores()[0] == @get('dealerHand').scores()[0]
      console.log 'tie'
      @trigger 'tie', @
    else
      console.log 'player is Winner (player higher score)'
      @trigger 'playerIsWinner', @
    return

  dealerTurn: =>
    @get('dealerHand').makeDealerTurn()
    return
