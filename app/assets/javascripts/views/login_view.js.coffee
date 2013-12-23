self = null

Bandango.LoginView = Ember.View.extend
  tagName: "form"

  loginSuccess: (user) ->
    Bandango.currentSession.logInAs user
    alertify.log "Hola, #{user.username}"
    # window.location.hash = "#/dashboard"
    self.get("controller").transitionToRoute "dashboard"

  loginFailure: (response) ->
    self.setProperties
      sendingRequest: false
      error: response.responseJSON.message
    alertify.log "Ups, algo salió mal"

  submit: ->
    self = @
    @setProperties
      sendingRequest: true
      error: null
    data = @getProperties "username", "password"
    $.post("/sessions.json", data).then @loginSuccess, @loginFailure
    false
