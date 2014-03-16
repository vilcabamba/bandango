Bandango.OrderableFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin, Bandango.FormasDePagoOnFormMixin,
  queryForClienteOnIdentificacionChange: true
  modelBinding: "controller.model"
  includeForm: true

  includeSearchClienteButton: true

# model
  reSetAssociations: (model) ->
    # orderItems
    newOrderItems = model.get("orderItems")
    while orderItem = @get("model.orderItems.firstObject")
      newOrderItems.addObject orderItem
    # retenciones
    newRetenciones = model.get("retenciones")
    while retencion = @get("model.retenciones.firstObject")
      newRetenciones.addObject retencion

  failureSaving: (modelName) ->
    if @get("model.isNew")
      store = @get("controller.store")
      model = store.createRecord modelName,
                                 cliente: @get("model.cliente")
                                 comprobante: @get("model.comprobante")
      @reSetAssociations model
      @get("model").deleteRecord()
      @set "model", model
    else
      @get("model").rollback()
    null

  modelSaved: ->
    if @get("removeOrderItemsWithoutIdAfterCommit")
      # delete orderItems instantiated and not persisted:
      for orderItem in @get("model").get("orderItems.content").filterBy("id", null)
        orderItem.deleteRecord()

# cliente
  failureSavingCliente: (response) ->
    cliente = @get "model.cliente"
    if cliente.get("isNew")
      cliente.deleteRecord()
      @set "model.cliente", null
      @set "tipoId", "RUC"
    else
      cliente.rollback()
    @failureCallback response, "Hubo un problema guardando el cliente"

  clienteSaved: ->
    Ember.debug "cliente saved! override this method"

  saveCliente: ->
    cliente = @get "model.cliente"
    if cliente
      cliente.setProperties @getFormDataFor("cliente")
    else
      store = @get "controller.store"
      cliente = store.createRecord "cliente", @getFormDataFor("cliente")
      @set "model.cliente", cliente
    cliente.save().then $.proxy(@clienteSaved, @), $.proxy(@failureSavingCliente, @)

# events
  submit: ->
    @emptyErrors()
    @saveCliente()
    @set "submitting", true
    false
