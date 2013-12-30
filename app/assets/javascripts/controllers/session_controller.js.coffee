Bandango.SessionController = Ember.Controller.extend
  logInAs: (user) ->
    Ember.debug "logging in with token #{user.token}"
    @set "user", Bandango.CurrentUser.create(user)
    $.ajaxSetup
      headers: { "Authorization": "Token token=\"#{user.token}\""}

  loggedIn: (->
    !!@get("user")
  ).property("user")

  requireLogin: (route) ->
    unless @get("loggedIn")
      route.transitionTo "login"

Bandango.currentSession = Bandango.SessionController.create()
