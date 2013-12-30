Bandango.UserOnListView = Ember.View.extend
  tagName: "a"
  classNames: "person_on_list"
  templateName: "users/user_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/users/#{@get("model").get("id")}"
  ).property()

