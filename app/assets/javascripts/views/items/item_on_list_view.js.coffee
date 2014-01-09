Bandango.ItemOnListView = Bandango.ModelOnListView.extend
  templateName: "items/item_on_list"

  href: (->
    "#/categorias/#{@get("model.category.id")}/#{@get("model.id")}"
  ).property()
