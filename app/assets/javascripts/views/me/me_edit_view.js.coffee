Bandango.MeEditView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  modelBinding: "controller.model"
  attributes: ["nombres", "username", "email", "password", "password_confirmation"]

  successEditing: (user) ->
    Bandango.currentSession.logInAs user
    @get("controller").transitionToRoute "me.index"
    @successCallback "Tu perfil fue actualizado"

  failureEditing: (response) ->
    @failureCallback {errors: response.responseJSON}

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    unless data.password is data.password_confirmation
      @setErrors password: ["Las contraseñas no coinciden"]
      return false
    @set "submitting", true
    $.post("/api/current_user", {user: data}).then $.proxy(@successEditing, @), $.proxy(@failureEditing, @)
    false
