Bandango.ModelBackedView = Ember.View.extend
  raw_errors: {}
  errors: {}

  tagName: "form"

  errors_messages: (->
    messages = []
    for key, value of @get("raw_errors")
      messages.push "#{key}: #{value.join(", ")}"
    messages
  ).property("raw_errors")

  actionText: (->
    if not @get("model") or @get("model").get("isNew") then "Nuevo" else "Editar"
  ).property("model")

  submitButtonText: (->
    if not @get("model") or @get("model").get("isNew") then "Crear" else "Actualizar"
  ).property("model")

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
