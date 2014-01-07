Bandango.CategoriasIndexRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.currentSession.requireLogin @

  model: ->
    @get("store").findAll "category"
