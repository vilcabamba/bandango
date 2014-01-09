Ember.TextField.reopen
  attributeBindings: ["required", "step"]

  enabledChanged: (->
    @set "disabled", @get("enabled")
  ).observes("enabled")
