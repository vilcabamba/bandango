self = null

Bandango.MeEditView = Bandango.ModelBackedView.extend
  tagName: "form"

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
