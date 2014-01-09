Bandango.VentasEditView = Bandango.VentaFormView.extend
  bindAttributesTo: "model.cliente"

  ventaSaved: (venta) ->
    @_super venta
    @successCallback "Venta actualizada"
