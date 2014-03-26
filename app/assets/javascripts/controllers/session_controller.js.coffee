Bandango.SessionController = Ember.Controller.extend
  login: ->
    if userProperties = @get("userProperties")
      @set "user", @store.push("user", @get("userProperties"))

  initializeWithStore: (@store) ->
    @login()

  willLoginAs: (userProperties) ->
    @set "userProperties", userProperties
    Ember.debug "will log in with token #{userProperties.token}"
    $.ajaxSetup
      headers: { "Authorization": "Token token=\"#{userProperties.token}\""}

  logInAs: (userProperties) ->
    @set "userProperties", userProperties
    @login()

  loggedIn: (->
    !!@get("user")
  ).property("user")

  requireLogin: (route) ->
    unless @get("loggedIn")
      route.transitionTo "login"

Bandango.currentSession = Bandango.SessionController.create()
