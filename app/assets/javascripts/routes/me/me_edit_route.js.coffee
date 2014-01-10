Bandango.MeEditRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    Bandango.currentSession.get("user")
