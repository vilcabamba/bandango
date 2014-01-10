Bandango.UsersIndexRoute = Bandango.RequireAuthenticationRoute.extend
  
  beforeModel: ->
    Bandango.currentSession.requireLogin @

  model: ->
    @get("store").findAll "user"
