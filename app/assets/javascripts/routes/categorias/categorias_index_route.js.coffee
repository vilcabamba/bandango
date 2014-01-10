Bandango.CategoriasIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").findAll "category"
