Bandango.VentaBaseRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.comprobantesHelper.loadComprobantes(@get("store"))

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
