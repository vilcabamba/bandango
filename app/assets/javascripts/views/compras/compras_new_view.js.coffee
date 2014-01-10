Bandango.ComprasNewView = Bandango.CompraFormView.extend
  bindAttributesTo: null
  removeOrderItemsWithoutIdAfterCommit: true

  compraSaved: (compra) ->
    @_super compra
    @successCallback "Compra creada"
