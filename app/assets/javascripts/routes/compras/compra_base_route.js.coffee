Bandango.CompraBaseRoute = Bandango.AuthenticationRequiredRoute.extend
  beforeModel: ->
    @_super()
    store = @get("store")
    Bandango.comprobantesHelper.loadComprobantes store

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
