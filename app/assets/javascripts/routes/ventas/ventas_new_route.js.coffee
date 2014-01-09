Bandango.VentasNewRoute = Bandango.VentaBaseRoute.extend
  model: ->
    @get("store").createRecord("venta")
