Bandango.CierresCajaNewView = Bandango.CierreCajaFormView.extend
  failureSavingCierreCaja: (response) ->
    # re - sets properties
    model = @get("model")
    cashDenominationItems = model.get("cashDenominationItems.content")
    properties = model.getProperties "totales", "fondoAnterior", "efectivoVentas", "ivaVentas", "iceVentas", "efectivoCompras", "ivaCompras", "iceCompras", "efectivoTeorico", "retiro", "user"
    model.rollback()
    model.transitionTo("created.uncommitted")
    model.setProperties properties
    for cashDenominationItem in cashDenominationItems
      model.get("cashDenominationItems").addObject cashDenominationItem
    @failureCallback response

  cierreCajaSaved: (cierreCaja) ->
    @_super cierreCaja
    @successCallback "Has cerrado la caja"
