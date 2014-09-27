#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # # listen 'change: isMyTurn' -> whoseTurnC
    # @get('playerHand').on 'change:isMyTurn', @whoseTurn()
    # # listen 'game is over ' -> checktheWinner
    # @get('playerHand').on 'gameIsOver', @checkWinner()
    # @get('dealerHand').on 'gameIsOver', @checkWinner()

  # checkWinner: ->
  #   if @get('playerHand').score() > @get('dealerHand').score()
  #     @trigger 'dealerIsWinner', @
  #   else if @get('playerHand').score() == @get('dealerHand').score()
  #     @trigger 'tie', @
  #   else
  #     @trigger 'playerIsWinner', @

  # whoseTurn: (playerOrDealer) ->
  #   if playerOrDealer == @get 'playerHand'
  #     @get('dealerHand').makeDealerTurn()
  #   else
  #     @checkWinner()

