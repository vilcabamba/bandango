Bandango.VentasNewView = Bandango.VentaFormView.extend
  bindAttributesTo: null
  removeOrderItemsWithoutIdAfterCommit: true

  ventaSaved: (venta) ->
    @_super venta
    @successCallback "Venta creada"
