Bandango.CierreCajaFormView = Bandango.ModelBackedView.extend
  modelBinding: "controller.model"

  cierreCajaSaved: (cierreCaja) ->
    @successCallback "Cierre de caja guardado"
    @get("controller").transitionToRoute "cierres_caja.show", cierreCaja.get("id")

  reSetAssociations: (model) ->
    # cashDenominationItems
    cashDenominationItems = model.get("cashDenominationItems")
    while cashDenominationItem = @get("model.cashDenominationItems.firstObject")
      cashDenominationItems.addObject cashDenominationItem
    # this fields will be unset when assigning new model to the view
    infoFields = ["totales", "fondoAnterior", "efectivoVentas", "ivaVentas", "iceVentas", "efectivoCompras", "ivaCompras", "iceCompras", "efectivoTeorico", "retiro"]
    for field in infoFields
      model.set field, @get("model.#{field}")

  failureSavingCierreCaja: (response) ->
    if @get("model.isNew")
      store = @get("controller.store")
      model = store.createRecord "cierreCaja"
      @reSetAssociations model
      @get("model").rollback()
      @set "model", model
    else
      @get("model").rollback()
    @failureCallback response
    null

  saveCierreCaja: ->
    @get("model").save().then $.proxy(@cierreCajaSaved, @), $.proxy(@failureSavingCierreCaja, @)

  submit: ->
    @saveCierreCaja()
    @set "submitting", true
    false
