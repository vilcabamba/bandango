Bandango.AuthenticationRequiredRoute = Ember.Route.extend Bandango.AsyncModelRouteMixin,
  beforeModel: ->
    Bandango.currentSession.requireLogin @
