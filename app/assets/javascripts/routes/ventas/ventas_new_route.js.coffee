Bandango.VentasNewRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.comprobantesHelper.loadComprobantes(@get("store"))

  model: ->
    @get("store").createRecord("venta")
