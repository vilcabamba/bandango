Bandango.ApplicationRoute = Ember.Route.extend
  
  beforeModel: (transition) ->
    if Bandango.currentSession.get("loggedIn")
      @transitionTo "dashboard" if transition.targetName == "index"
    else
      @transitionTo "login"
