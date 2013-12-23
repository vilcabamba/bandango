self = null

Bandango.MeEditView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
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

  successEditing: (user) ->
    Bandango.currentSession.logInAs user
    self.get("controller").transitionToRoute "me.index"
    self.successCallback "Tu perfil fue actualizado"

  failureEditing: (response) ->
    self.failureCallback {errors: response.responseJSON}

  submit: ->
    self = @
    @emptyErrors()
    data = @getProperties "nombres", "username", "email", "password", "password_confirmation"
    unless data.password is data.password_confirmation
      @setErrors password: ["Las contraseñas no coinciden"]
      return false
    @set "submitting", true
    $.post("/api/current_user", {user: data}).then @successEditing, @failureEditing
    false
