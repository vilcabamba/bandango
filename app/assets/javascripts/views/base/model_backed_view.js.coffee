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
    $.map @get("raw_errors"), (text) ->
      text.join ", " if text
  ).property("raw_errors")

  newRecord: (->
    not @get("model") or @get("model").get("isNew")
  ).property("model")

  actionText: (->
    if @get("newRecord") then "Nuevo" else "Editar"
  ).property("newRecord")

  submitButtonText: (->
    if @get("newRecord") then "Crear" else "Actualizar"
  ).property("newRecord")

  getFormData: ->
    @getProperties @get("attributes")

  getFormDataFor: (modelName) ->
    @getProperties @get("attributesFor#{modelName.capitalize()}")

  defineComputedPropertiesForAttributes: ->
    attributes = @get("attributes")
    if attributes.constructor is Array
      if bindTo = @get("bindAttributesTo")
        for attribute in attributes
          Ember.defineProperty @, attribute, (->
            @get(bindTo).get(arguments[0])
          ).property()
    else if attributes.constructor is Object
      for key, value of attributes
        for attribute in value
          Ember.defineProperty @, attribute, (->
            bindTo = @findBindingAttributeTo(arguments[0])
            @get(bindTo).get(arguments[0])
          ).property()
    null

  findBindingAttributeTo: (name) ->
    for key, value of @get("attributes")
      return key if name in value

# errors:
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

# callbacks:
  failureCallback: (response, errorMessage = "Ups, algo salió mal") ->
    @setErrors response.errors
    @set "submitting", false
    alertify.log errorMessage
    null

  successCallback: (message) ->
    alertify.log message
    null
