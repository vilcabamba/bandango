#= require ./cierre_caja_form_view

Bandango.CierreCajaEditView = Bandango.CierreCajaFormView.extend
  cierreCajaSaved: (cierreCaja) ->
    @_super cierreCaja
    @successCallback "Cierre de caja actualizado"
