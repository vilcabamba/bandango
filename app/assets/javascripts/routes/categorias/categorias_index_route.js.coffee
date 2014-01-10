Bandango.CategoriasIndexRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    @get("store").findAll "category"
