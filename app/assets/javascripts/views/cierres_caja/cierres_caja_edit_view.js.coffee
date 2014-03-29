#= require ./cierre_caja_form_view

Bandango.CierresCajaEditView = Bandango.CierreCajaFormView.extend
  failureSavingCierreCaja: (response) ->
    model = @get("model")
    model.rollback()

  cierreCajaSaved: (cierreCaja) ->
    @_super cierreCaja
    @successCallback "Cierre de caja actualizado"
