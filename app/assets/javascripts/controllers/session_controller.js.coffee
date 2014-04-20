Bandango.SessionController = Ember.Controller.extend
  init: ->
    if userProperties = window.bandangoWillLoginAs
      @set "userProperties", userProperties
      $.ajaxSetup
        headers: { "Authorization": "Token token=\"#{userProperties.token}\""}
      $("#bandango_will_login").remove() # remove token script from document
      window.bandangoWillLoginAs = null  # remove global variable

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
