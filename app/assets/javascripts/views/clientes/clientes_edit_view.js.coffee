Bandango.ClientesEditView = Bandango.ClienteFormView.extend
  templateName: "clientes/new"
  modelBinding: "controller.model"

  success: (cliente) ->
    @successCallback cliente, "actualizado"

  failure: (response) ->
    @get("model").rollback()
    @failureCallback response

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    cliente = @get("model")
    cliente.setProperties data
    cliente.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
