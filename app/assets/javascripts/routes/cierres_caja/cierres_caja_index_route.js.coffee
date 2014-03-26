Bandango.CierresCajaIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    @get("store").findAll "cierreCaja"
