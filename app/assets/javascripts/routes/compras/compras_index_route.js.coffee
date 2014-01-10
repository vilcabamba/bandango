Bandango.ComprasIndexRoute = Ember.Route.extend
  model: ->
    @get("store").findAll "compra"
