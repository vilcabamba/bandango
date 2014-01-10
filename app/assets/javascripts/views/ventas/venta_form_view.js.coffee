Bandango.VentaFormView = Bandango.OrderableFormView.extend
  clienteSaved: ->
    @saveVenta()

# venta
  failureSavingVenta: (response) ->
    @get("model").rollback()
    @failureCallback response

  ventaSaved: (venta) ->
    if @get("removeOrderItemsWithoutIdAfterCommit")
      # delete orderItems instantiated and not persisted:
      for orderItem in venta.get("orderItems.content").filterBy("id", null)
        orderItem.deleteRecord()
    @get("controller").transitionToRoute "ventas.show", venta.get("id")

  saveVenta: ->
    @get("model").save().then $.proxy(@ventaSaved, @), $.proxy(@failureSavingVenta, @)

# events
  submit: ->
    @emptyErrors()
    @saveCliente()
    @set "submitting", true
    false
