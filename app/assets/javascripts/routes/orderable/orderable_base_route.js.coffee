Bandango.OrderableBaseRoute = Bandango.AuthenticationRequiredRoute.extend
  beforeModel: ->
    @_super()
    store = @get("store")
    filters = [
      Bandango.comprobantesHelper.loadComprobantes(store),
      Bandango.conceptoRetencionFuenteHelper.loadComprobantes(store)
    ]
    Ember.RSVP.all filters
