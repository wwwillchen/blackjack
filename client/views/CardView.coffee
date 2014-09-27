class window.CardView extends Backbone.View

  #tagname: div (default)
  className: 'card'

  # tagname: img

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'
  # template: _.template  '<%= rankName %> of <%= suitName %>'
#<div class="card" style="background-image: url('img/cards/10-clubs.png'); background-size: 100px 140px "></div>
  initialize: ->
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    #@$el.css =
    @$el.addClass 'covered' unless @model.get 'revealed'

#template: _.template <p> TEXT <%= rankName %> </p>
