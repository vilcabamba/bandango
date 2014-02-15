Bandango.VentaFormView = Bandango.OrderableFormView.extend
  clienteSaved: ->
    @saveVenta()

# venta
  failureSavingVenta: (response) ->
    if @get("model.isNew")
      # allocate new venta
      store = @get("controller.store")
      model = store.createRecord "venta",
        cliente: @get("model.cliente")
        comprobante: @get("model.comprobante")
        orderItems: @get("model.orderItems.content")
      @get("model").deleteRecord()
      @set "model", model
    else
      @get("model").rollback()
    @failureCallback response

  ventaSaved: (venta) ->
    @modelSaved()
    @get("controller").transitionToRoute "ventas.show", venta.get("id")

  saveVenta: ->
    @get("model").save().then $.proxy(@ventaSaved, @), $.proxy(@failureSavingVenta, @)
