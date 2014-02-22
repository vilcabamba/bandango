Bandango.VentasEditView = Bandango.VentaFormView.extend
  attributes: (->
    "model.cliente": @get("attributesForCliente")
  ).property()
  removeOrderItemsWithoutIdAfterCommit: false

  ventaSaved: (venta) ->
    @_super venta
    @successCallback "Venta actualizada"
