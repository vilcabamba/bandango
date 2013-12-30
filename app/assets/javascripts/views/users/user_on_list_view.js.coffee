Bandango.UserOnListView = Ember.View.extend
  tagName: "a"
  className: "person_on_list"
  templateName: "users/user_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/usuarios/#{@get("model").get("id")}"
  ).property()

