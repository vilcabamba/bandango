Bandango.MeEditRoute = Ember.Route.extend
  model: ->
    Bandango.currentSession.get("user")
