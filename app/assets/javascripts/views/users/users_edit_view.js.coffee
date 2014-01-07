Bandango.UsersEditView = Bandango.UserFormView.extend
  templateName: "users/new"
  modelBinding: "controller.model"

# editing
  successEditing: (user) ->
    @successCallback user, "actualizado"
    user.set "password", undefined

  failureEditing: (response) ->
    @get("model").rollback()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    unless data.password is data.password_confirmation
      @setErrors password: ["Las contraseñas no coinciden"]
      return false
    user = @get("model")
    user.setProperties data
    user.save().then $.proxy(@successEditing, @), $.proxy(@failureEditing, @)
    @set "submitting", true
    false

  successDestroying: ->
    alertify.log "Usuario eliminado"
    @get("controller").transitionToRoute "users.index"

  failureDestroying: ->
    @get("model").rollback()
    alertify.log "Algo salió mal. Por favor vuelve a intentar"
    @set "submitting", false

  actions:
    destroyUser: ->
      @set "submitting", true
      @get("model").destroyRecord().then $.proxy(@successDestroying, @), $.proxy(@failureDestroying, @)