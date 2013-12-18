Bandango.LoginRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo "/" if Bandango.currentSession.get("loggedIn")
