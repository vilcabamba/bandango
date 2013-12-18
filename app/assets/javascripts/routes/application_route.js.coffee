Bandango.ApplicationRoute = Ember.Route.extend
  
  beforeModel: ->
    @transitionTo "login" unless Bandango.currentSession.get("loggedIn")
