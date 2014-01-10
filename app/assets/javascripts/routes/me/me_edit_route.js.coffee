Bandango.MeEditRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    Bandango.currentSession.get("user")
