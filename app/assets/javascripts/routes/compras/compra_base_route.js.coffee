Bandango.CompraBaseRoute = Bandango.AuthenticationRequiredRoute.extend
  beforeModel: ->
    @_super()
    store = @get("store")
    filters = [
      Bandango.comprobantesHelper.loadComprobantes(store),
      Bandango.sustentoTributarioComprobantesHelper.loadComprobantes(store),
      Bandango.conceptoRetencionFuenteHelper.loadComprobantes(store)
    ]
    Ember.RSVP.all filters

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
