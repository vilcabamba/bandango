Bandango.LoginView = Ember.View.extend
  tagName: "form"

  loginSuccess: (user) ->
    Bandango.currentSession.logInAs user
    alertify.log "Hola, #{user.username}"
    @get("controller").transitionToRoute "dashboard"

  loginFailure: (response) ->
    @setProperties
      sendingRequest: false
      error: response.responseJSON.message
    alertify.log "Tu nombre de usuario y/o contraseña no coinciden"

  submit: ->
    @setProperties
      sendingRequest: true
      error: null
    data = @getProperties "username", "password"
    $.post("/sessions.json", data).then $.proxy(@loginSuccess, @), $.proxy(@loginFailure, @)
    false
