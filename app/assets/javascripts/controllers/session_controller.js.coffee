Bandango.SessionController = Ember.Controller.extend
  initializeWithStore: (store) ->
    if userProperties = @get("userProperties")
      @set "user", store.push("user", userProperties)

  willLoginAs: (userProperties) ->
    @set "userProperties", userProperties
    Ember.debug "logging in with token #{userProperties.token}"
    $.ajaxSetup
      headers: { "Authorization": "Token token=\"#{userProperties.token}\""}

  loggedIn: (->
    !!@get("user")
  ).property("user")

  requireLogin: (route) ->
    unless @get("loggedIn")
      route.transitionTo "login"

Bandango.currentSession = Bandango.SessionController.create()
