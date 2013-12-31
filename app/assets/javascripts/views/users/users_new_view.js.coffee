Bandango.UsersNewView = Bandango.UserFormView.extend
  bindAttributesTo: null

  nombres: (-> "").property()

  success: (user) ->
    @successCallback user, "creado"

  failure: (response) ->
    @new_user.deleteRecord()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    unless data.password is data.password_confirmation
      @setErrors password: ["Las contraseñas no coinciden"]
      return false
    delete data.password_confirmation
    store = @get("controller").get("store")
    @new_user = store.createRecord "user", data
    @new_user.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
