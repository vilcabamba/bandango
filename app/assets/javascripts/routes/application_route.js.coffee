Bandango.ApplicationRoute = Ember.Route.extend
  
  beforeModel: ->
    if Bandango.currentSession.get("loggedIn")
      @transitionTo "dashboard"
    else
      @transitionTo "login"
