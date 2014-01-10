Bandango.ComprasIndexRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    @get("store").findAll "compra"
