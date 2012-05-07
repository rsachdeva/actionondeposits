class Raffler.Views.EntriesIndex extends Backbone.View
  template: JST['entries/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    #TODO: $(@el).html(@template(entries: @collection))
    this
