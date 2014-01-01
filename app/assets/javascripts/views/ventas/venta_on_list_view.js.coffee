Bandango.VentaOnListView = Ember.View.extend
  tagName: "a"
  templateName: "ventas/venta_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/ventas/#{@get("model").get("id")}"
  ).property()
