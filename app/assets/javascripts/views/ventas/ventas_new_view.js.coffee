Bandango.VentasNewView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin,
  bindAttributesTo: null
  queryForClienteOnIdentificacionChange: true
  modelBinding: "controller.model"

# cliente
  failureSavingCliente: (response) ->
    cliente = @get("model.cliente")
    if cliente.get("isNew")
      cliente.deleteRecord()
      @set "model.cliente", null
      @set "tipoId", "RUC"
    else
      cliente.rollback()
    @failureCallback response, "Hubo un problema guardando el cliente"

  saveCliente: ->
    cliente = @get "model.cliente"
    if cliente
      cliente.setProperties @getFormData()
    else
      store = @get "controller.store"
      cliente = store.createRecord "cliente", @getFormData()
      @set "model.cliente", cliente
    cliente.save().then $.proxy(@saveVenta, @), $.proxy(@failureSavingCliente, @)

# venta
  failureSavingVenta: (response) ->
    @get("model").rollback()
    @failureCallback response

  ventaSaved: (venta) ->
    @successCallback "Venta creada"
    @get("controller").transitionToRoute "ventas.show", venta.get("id")

  saveVenta: ->
    @get("model").save().then $.proxy(@ventaSaved, @), $.proxy(@failureSavingVenta, @)

# events
  submit: ->
    @emptyErrors()
    @saveCliente()
    @set "submitting", true
    false
