Bandango.OrderableFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin,
  queryForClienteOnIdentificacionChange: true
  modelBinding: "controller.model"
  includeForm: true

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
