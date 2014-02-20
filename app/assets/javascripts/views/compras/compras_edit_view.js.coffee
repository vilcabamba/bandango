Bandango.ComprasEditView = Bandango.CompraFormView.extend
  attributes: (->
    "model.cliente": @get("attributesForCliente"),
    "model":  @get("attributesForCompra")
  ).property()

  removeOrderItemsWithoutIdAfterCommit: false

  compraSaved: (compra) ->
    @_super compra
    @successCallback "Compra actualizada"
