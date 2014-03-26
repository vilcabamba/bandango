Bandango.CierresCajaNewView = Bandango.CierreCajaFormView.extend
  cierreCajaSaved: (cierreCaja) ->
    @_super cierreCaja
    @successCallback "Has cerrado la caja"
