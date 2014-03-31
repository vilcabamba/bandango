prepareCierreCaja = Bandango.cierreCajaInteractorHelper.prepareCierreCaja

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
        @set "cierreCajaProperties", cierreCaja
        @set "cierreCajaProperties.user", Bandango.currentSession.get("user")
    Ember.RSVP.all promises

  setupController: (controller) ->
    cierreCaja = @get("store").createRecord("cierreCaja", @get("cierreCajaProperties"))
    controller.set "model", cierreCaja
    prepareCierreCaja(cierreCaja: cierreCaja, cashDenominations: @get("cashDenominations"), store: @get("store"))

  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      model.rollbackAssociations()
      model.deleteRecord()
