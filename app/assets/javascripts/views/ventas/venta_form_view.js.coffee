Bandango.VentaFormView = Bandango.OrderableFormView.extend
  attributes: (->
    @get("attributesForCliente")
  ).property()

  clienteSaved: ->
    @saveVenta()

# venta
  failureSavingVenta: (response) ->
    @failureSaving "venta"
    @failureCallback response

  ventaSaved: (venta) ->
    @modelSaved()
    @get("controller").transitionToRoute "ventas.show", venta.get("id")

  saveVenta: ->
    @get("model").save().then $.proxy(@ventaSaved, @), $.proxy(@failureSavingVenta, @)
