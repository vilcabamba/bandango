Bandango.ClientesNewView = Bandango.ClienteFormView.extend
  bindAttributesTo: null

  success: (cliente) ->
    @successCallback cliente, "creado"

  failure: (response) ->
    @new_cliente.deleteRecord()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    store = @get("controller.store")
    @new_cliente = store.createRecord "cliente", data
    @new_cliente.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
