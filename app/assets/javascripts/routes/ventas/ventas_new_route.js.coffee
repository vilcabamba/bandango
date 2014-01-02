Bandango.VentasNewRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.comprobantesHelper.loadComprobantes(@get("store"))
