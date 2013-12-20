Bandango.ModelBackedView = Ember.View.extend
  raw_errors: {}
  errors: {}

  errors_messages: (->
    messages = []
    for key, value of @get("raw_errors")
      messages.push "#{key}: #{value.join(", ")}"
    messages
  ).property("raw_errors")

  emptyErrors: ->
    @setProperties
      errors: {}
      raw_errors: {}

  setErrors: (the_errors) ->
    errors = {}
    for key, value of the_errors
      errors[key] = "has-error"
    @setProperties
      errors: errors
      raw_errors: the_errors
