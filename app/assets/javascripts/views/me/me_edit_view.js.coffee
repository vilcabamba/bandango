Bandango.MeEditView = Bandango.UserFormView.extend

  successEditing: (user) ->
    Bandango.currentSession.logInAs user
    @get("controller").transitionToRoute "me.index"
    @successCallback "Tu perfil fue actualizado"

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
