Bandango.CierresCajaNewRoute = Bandango.AuthenticationRequiredRoute.extend
  beforeModel: ->
    @_super()
    promises = []
    unless @get("cashDenominations") # fetch cashDenominations unless we have them
      promises.push @get("store").find("cash_denomination").then (cashDenominations) =>
        @set "cashDenominations", cashDenominations
    # fetch new cierre_caja's attributes
    promises.push $.get("/api/cierres_caja/new.json").then (response) =>
        # camelize keys:
        cierreCaja = {}
        for key, value of response.cierre_caja
          cierreCaja[key.camelize()] = value
        @set "cierre_caja", cierreCaja
        @set "cierre_caja.user", Bandango.currentSession.get("user")
    Ember.RSVP.all promises

  setupController: (controller) ->
    controller.set "model", @get("store").createRecord("cierreCaja", @get("cierre_caja"))
    controller.set "cashDenominations", @get("cashDenominations")

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
      model.rollbackAssociations()
