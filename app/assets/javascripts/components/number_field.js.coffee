onlyNumberHelper = (input) ->
  Number String(input).replace(/[^\d.]/g, "")

Bandango.NumberField = Ember.TextField.extend
  type: "number"
  _cleanValue: (->
    @set "value", onlyNumberHelper(@get("value"))
  ).observes("value")
