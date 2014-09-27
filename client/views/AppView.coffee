class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button ">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    # # @model.get('playerHand').on "endPlayerTurn" @hideButton
    # # @model.get('playerHand').on console.log 'heard the playerHand event'

  initialize: ->
    @render()
    @model.on 'dealerIsWinner', @dealerWinner
    @model.on 'playerIsWinner', @playerWinner
    @model.on 'tie', @tie

  dealerWinner: ->
    alert 'Dealer is Winner'

  playerWinner: ->
    alert 'Player is Winner'

  tie: ->
    alert 'Tie!'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
