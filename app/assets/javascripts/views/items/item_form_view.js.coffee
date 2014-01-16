Bandango.ItemFormView = Bandango.ModelBackedView.extend
  attributes: ["nombre", "descripcion", "seVende", "baseVenta", "seCompra", "baseCompra", "iva", "ivaTarifa", "ice", "iceTarifa"]

  successCallback: (item, action) ->
    @_super "#{item.get("nombre")} #{action}"
    @get("controller").transitionTo "items.show", item.get("id")
