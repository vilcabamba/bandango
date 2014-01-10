Bandango.VentaBaseRoute = Bandango.RequireAuthenticationRoute.extend
  beforeModel: ->
    @_super()
    Bandango.comprobantesHelper.loadComprobantes(@get("store"))

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
