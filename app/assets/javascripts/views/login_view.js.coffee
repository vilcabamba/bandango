self = null

Bandango.LoginView = Ember.View.extend
  tagName: "form"

  loginSuccess: (user) ->
    Bandango.currentSession.logInAs user
    self.set "sendingRequest", false

  loginFailure: (response) ->
    self.setProperties
      sendingRequest: false
      error: response.responseJSON.message

  submit: ->
    self = @
    @setProperties
      sendingRequest: true
      error: null
    data = @getProperties "username", "password"
    $.post("/sessions.json", data).then @loginSuccess, @loginFailure
    false
