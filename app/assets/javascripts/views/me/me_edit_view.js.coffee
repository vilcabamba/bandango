self = null

Bandango.MeEditView = Ember.View.extend
  tagName: "form"
  raw_errors: {}
  errors: {}

  model: (->
    @get("controller").get("model")
  ).property("controller.model")

  nombres: (->
    @get("model").get("nombres")
  ).property()
  username: (->
    @get("model").get("username")
  ).property()
  email: (->
    @get("model").get("email")
  ).property()

  errors_messages: (->
    messages = ""
    for key, value of @get("raw_errors")
      messages += "#{key}: #{value.join(", ")}. "
    messages
  ).property("raw_errors")

  emptyErrors: ->
    @setProperties
      errors: {}
      raw_errors: {}

  setErrors: (obj) ->
    errors = {}
    for key, value of obj
      errors[key] = "has-error"
    @setProperties
      errors: errors
      raw_errors: obj

  failureEditing: (response) ->
    self.setErrors response.responseJSON
    self.set "submitting", false

  successEditing: (user) ->
    Bandango.currentSession.logInAs user
    self.get("controller").transitionToRoute "me.index"

  submit: ->
    self = @
    @emptyErrors()
    data = @getProperties "nombres", "username", "email", "password", "password_confirmation"
    unless data.password is data.password_confirmation
      @set "errors", "Las contraseñas no coinciden"
      return false
    @set "submitting", true
    $.post("/api/current_user", {user: data}).then @successEditing, @failureEditing
    false
