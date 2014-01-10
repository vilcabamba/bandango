Bandango.AuthenticationRequiredRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.currentSession.requireLogin @
