Bandango.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    Bandango.currentSession.initializeWithStore @get("store")
    if Bandango.currentSession.get("loggedIn")
      @transitionTo "dashboard" if transition.targetName == "index"
    else
      @transitionTo "login"

  actions:
    error: Raven.onBandangoError
