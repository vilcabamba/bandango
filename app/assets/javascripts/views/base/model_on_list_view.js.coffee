Bandango.ModelOnListView = Ember.View.extend
  tagName: "a"
  layoutName: "base/model_on_list"
  attributeBindings: ["href"]
  classNames: ["model_on_list"]

  href: (->
    "#/#{@get("baseRoute")}/#{@get("model.id")}"
  ).property()

  baseRoute: (->
    # default baseRoute based on model's name
    modelName = String(@get("model").constructor).split(".")[1]
    modelName.decamelize().pluralize()
  ).property()
