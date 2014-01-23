Bandango.PreferenciasEditRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").find "emisor", 1
