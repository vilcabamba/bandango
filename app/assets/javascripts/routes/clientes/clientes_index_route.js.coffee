Bandango.ClientesIndexRoute = Ember.Route.extend
  model: ->
    @get("store").findAll "cliente"
