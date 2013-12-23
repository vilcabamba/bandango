Bandango.ModelBackedView = Ember.View.extend
  # defaults
  raw_errors: {}
  errors: {}
  tagName: "form"
  attributes: []
  bindAttributesTo: "model"

  init: ->
    @_super()
    @defineComputedPropertiesForAttributes()

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

  getFormData: ->
    @getProperties @get("attributes")

  defineComputedPropertiesForAttributes: ->
    if bindTo = @get("bindAttributesTo")
      for attribute in @get("attributes")
        Ember.defineProperty @, attribute, (->
          @get(bindTo).get(arguments[0])
        ).property()
    null

  emptyErrors: ->
    @setProperties
      errors: {}
      raw_errors: {}
    null

  setErrors: (the_errors) ->
    errors = {}
    for key, value of the_errors
      errors[key] = "has-error"
    @setProperties
      errors: errors
      raw_errors: the_errors
    null
