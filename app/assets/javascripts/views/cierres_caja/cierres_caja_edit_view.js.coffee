#= require ./cierre_caja_form_view

Bandango.CierresCajaEditView = Bandango.CierreCajaFormView.extend
  cierreCajaSaved: (cierreCaja) ->
    @_super cierreCaja
    @successCallback "Cierre de caja actualizado"
