Bandango.CompraFormView = Bandango.OrderableFormView.extend Bandango.SustentoTributarioOnFormMixin,
  attributesForCompra: ["numeroSerieEstablecimiento", "numeroSeriePuntoEmision", "numeroSerieComprobante", "fechaEmision", "fechaRegistro", "autorizacionComprobante"]

  clienteSaved: ->
    @saveCompra()

# compra
  failureSavingCompra: (response) ->
    if @get("model.isNew")
      # allocate new compra
      store = @get("controller.store")
      model = store.createRecord "compra",
        cliente: @get("model.cliente")
        comprobante: @get("model.comprobante")
        orderItems: @get("model.orderItems.content")
      @get("model").deleteRecord()
      @set "model", model
    else
      @get("model").rollback()
    @failureCallback response

  compraSaved: (compra) ->
    @modelSaved()
    @get("controller").transitionToRoute "compras.show", compra.get("id")

  saveCompra: ->
    compra = @get("model")
    compra.setProperties @getFormDataFor("compra")
    compra.save().then $.proxy(@compraSaved, @), $.proxy(@failureSavingCompra, @)
