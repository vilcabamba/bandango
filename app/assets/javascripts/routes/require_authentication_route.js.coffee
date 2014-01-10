Bandango.RequireAuthenticationRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.currentSession.requireLogin @
