window.Maturing =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Maturing.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  Maturing.init()
