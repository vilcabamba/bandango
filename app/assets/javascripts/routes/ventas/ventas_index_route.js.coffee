Bandango.VentasIndexRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    @get("store").findAll "venta"
