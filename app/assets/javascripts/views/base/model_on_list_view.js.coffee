Bandango.ModelOnListView = Ember.View.extend
  tagName: "a"
  layoutName: "base/model_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/#{@get("baseRoute")}/#{@get("model").get("id")}"
  ).property()

  baseRoute: (->
    # default baseRoute based on model's name
    modelName = String(@get("model").constructor).split(".")[1]
    modelName.toLowerCase().pluralize()
  ).property()
