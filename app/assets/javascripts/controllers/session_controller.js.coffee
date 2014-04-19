Bandango.SessionController = Ember.Controller.extend
  logOut: ->
    @set "user", null
    Bandango.ravenHelper.logOut()
    Bandango.__container__.lookup("controller:application").transitionToRoute "login"
    Bandango.__container__.lookup("store:main").init() # reset store
    alertify.log "Tu sesión ha caducado"

  login: ->
    if userProperties = @get("userProperties")
      @set "user", @store.push("user", userProperties)
      Bandango.ravenHelper.logIn(userProperties)

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
