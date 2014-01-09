Bandango.VentasNewView = Bandango.VentaFormView.extend
  bindAttributesTo: null

  ventaSaved: (venta) ->
    @_super venta
    @successCallback "Venta creada"
