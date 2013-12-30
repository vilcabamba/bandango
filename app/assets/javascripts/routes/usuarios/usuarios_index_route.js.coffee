Bandango.UsuariosIndexRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.currentSession.requireLogin @

  model: ->
    @get("store").findAll "usuario"
