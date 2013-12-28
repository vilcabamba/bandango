Bandango.ClienteOnListView = Ember.View.extend
  tagName: "a"
  classNames: "person_on_list"
  templateName: "clientes/cliente_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/clientes/#{@get("model").get("id")}"
  ).property()
