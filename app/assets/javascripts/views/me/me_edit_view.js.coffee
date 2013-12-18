Bandango.MeEditView = Ember.View.extend
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

  submit: ->
    data = @getProperties "nombres", "username", "email", "password", "password_confirmation"
    unless data.password is data.password_confirmation
      @set "errors", "La contraseña y su confirmación no coinciden"
      return false
    @set "submitting", true
    false
