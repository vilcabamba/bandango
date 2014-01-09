Bandango.ModelAddButtonView = Ember.View.extend
  layoutName: "base/model_add_button"
  classNames: ["clearfix"]

  linkTo: (->
    @get("route") + ".new"
  ).property()
