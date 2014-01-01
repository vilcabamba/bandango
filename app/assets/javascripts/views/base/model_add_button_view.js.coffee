Bandango.ModelAddButtonView = Ember.View.extend
  templateName: "base/model_add_button"
  classNames: ["clearfix"]

  linkTo: (->
    @get("route") + ".new"
  ).property()
