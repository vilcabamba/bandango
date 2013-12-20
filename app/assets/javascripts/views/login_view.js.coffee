self = null

Bandango.LoginView = Ember.View.extend
  tagName: "form"

  loginSuccess: (user) ->
    Bandango.currentSession.logInAs user
    self.get("controller").transitionToRoute "dashboard"
    alertify.success "Iniciaste sesión como #{user.username}"

  loginFailure: (response) ->
    self.setProperties
      sendingRequest: false
      error: response.responseJSON.message
    alertify.error "Verifica tu usuario y contraseña"

  submit: ->
    self = @
    @setProperties
      sendingRequest: true
      error: null
    data = @getProperties "username", "password"
    $.post("/sessions.json", data).then @loginSuccess, @loginFailure
    false
