Bandango.VentasNewRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.comprobantesHelper.loadComprobantes(@get("store"))

  model: ->
    @get("store").createRecord("venta")

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
