Bandango.MeEditView = Bandango.UserFormView.extend

  successEditing: (response) ->
    Bandango.currentSession.logInAs response.user
    @get("controller").transitionToRoute "me.index"
    @successCallback "Tu perfil fue actualizado"

  submit: ->
    @emptyErrors()
    data = @getFormData()
    unless data.password is data.password_confirmation
      @setErrors password: ["Las contraseñas no coinciden"]
      return false
    @set "submitting", true
    $.post("/api/current_user", {user: data}).then $.proxy(@successEditing, @), $.proxy(@failureEditing, @)
    false
