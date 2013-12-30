Bandango.UsuarioOnListView = Ember.View.extend
  tagName: "a"
  className: "person_on_list"
  templateName: "usuarios/usuario_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/usuarios/#{@get("model").get("id")}"
  ).property()

