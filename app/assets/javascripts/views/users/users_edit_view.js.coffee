Bandango.UsersEditView = Bandango.UserFormView.extend
  modelBinding: "controller.model"
  
# editing
  successEditing: (user) ->
    @successCallback user, "actualizado"

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
