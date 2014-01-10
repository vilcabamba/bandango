Bandango.ComprasNewRoute = Bandango.CompraBaseRoute.extend
  model: ->
    @get("store").createRecord("compra")
