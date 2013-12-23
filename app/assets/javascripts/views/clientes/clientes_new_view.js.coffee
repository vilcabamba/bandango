self = null

Bandango.ClientesNewView = Bandango.ClienteFormView.extend
  bindAttributesTo: null

  success: (cliente) ->
    self.successCallback cliente, "creado"

  failure: (response) ->
    self.new_cliente.deleteRecord()
    self.failureCallback response

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    store = @get("controller").get("store")
    @new_cliente = store.createRecord "cliente", data
    @new_cliente.save().then @success, @failure
    @set "submitting", true
    false
