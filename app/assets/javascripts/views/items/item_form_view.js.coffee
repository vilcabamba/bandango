Bandango.ItemFormView = Bandango.ModelBackedView.extend
  attributes: ["nombre", "descripcion", "base", "iva", "ivaTarifa", "ice", "iceTarifa"]

  successCallback: (item, action) ->
    @_super "#{item.get("nombre")} #{action}"
    @get("controller").transitionTo "items.show", item.get("id")
