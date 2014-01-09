Ember.TextField.reopen
  attributeBindings: ["required", "step"]

  disabled: (->
    if @get("enabledProperty")
      !@get("enabled")
  ).property("enabled")
