Bandango.VentasIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").findAll "venta"
