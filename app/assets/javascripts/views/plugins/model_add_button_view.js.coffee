Bandango.ModelAddButtonView = Ember.View.extend
  templateName: "plugins/model_add_button"
  classNames: ["clearfix"]

  linkTo: (->
    @get("route") + ".new"
  ).property()
