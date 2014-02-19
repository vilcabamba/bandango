#= require_tree ../orderable

Bandango.CompraBaseRoute = Bandango.OrderableBaseRoute.extend
  beforeModel: ->
    orderablePromises = @_super()
    store = @get("store")
    filters = [
      orderablePromises,
      Bandango.sustentoTributarioComprobantesHelper.loadComprobantes(store)
    ]
    Ember.RSVP.all filters

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
