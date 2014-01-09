Bandango.VentasEditView = Bandango.VentaFormView.extend
  bindAttributesTo: "model.cliente"
  removeOrderItemsWithoutIdAfterCommit: false

  ventaSaved: (venta) ->
    @_super venta
    @successCallback "Venta actualizada"
