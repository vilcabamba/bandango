Bandango.CompraFormView = Bandango.OrderableFormView.extend Bandango.SustentoTributarioOnFormMixin,
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
    @modelSaved(compra)
    @get("controller").transitionToRoute "compras.show", compra.get("id")

  saveCompra: ->
    @get("model").save().then $.proxy(@compraSaved, @), $.proxy(@failureSavingCompra, @)

# events
  submit: ->
    @emptyErrors()
    @saveCliente()
    @set "submitting", true
    false
