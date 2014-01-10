Bandango.UsersIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  
  beforeModel: ->
    Bandango.currentSession.requireLogin @

  model: ->
    @get("store").findAll "user"
