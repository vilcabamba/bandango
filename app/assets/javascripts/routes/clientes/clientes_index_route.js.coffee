Bandango.ClientesIndexRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    @get("store").findAll "cliente"
