Bandango.UsersIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").findAll "user"
