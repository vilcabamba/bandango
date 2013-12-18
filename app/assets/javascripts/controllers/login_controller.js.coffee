Bandango.LoginController = Ember.Controller.extend

  actions:
    login: (token) ->
      $.ajaxSetup
        headers: { "Authorization": "Token token=\"#{token}\""}
