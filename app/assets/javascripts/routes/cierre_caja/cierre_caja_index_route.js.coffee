Bandango.CierreCajaIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").findAll "cierreCaja"
