Bandango.ClientesEditView = Bandango.ClienteFormView.extend
  templateName: "clientes/new"
  modelBinding: "controller.model"

# editing
  successEditing: (cliente) ->
    @successCallback cliente, "actualizado"

  failureEditing: (response) ->
    @get("model").rollback()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormDataFor("cliente")
    cliente = @get("model")
    cliente.setProperties data
    cliente.save().then $.proxy(@successEditing, @), $.proxy(@failureEditing, @)
    @set "submitting", true
    false

# destroying
  successDestroying: ->
    alertify.log "Cliente eliminado"
    @get("controller").transitionToRoute "clientes.index"
    @set "submitting", false

  failureDestroying: (response) ->
    error = if response.errors.base then response.errors.base else "Algo salió mal. Por favor vuelve a intentar"
    alertify.log error
    @get("model").transitionTo "loaded.saved"
    @set "submitting", false

  actions:
    destroyCliente: ->
      @set "submitting", true
      @get("model").destroyRecord().then($.proxy(@successDestroying, @), $.proxy(@failureDestroying, @))
