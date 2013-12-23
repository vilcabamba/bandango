self = null

Bandango.ClientesEditView = Bandango.ClienteFormView.extend
  templateName: "clientes/new"
  modelBinding: "controller.model"

  success: (cliente) ->
    self.successCallback cliente, "actualizado"

  failure: (response) ->
    self.failureCallback response

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    cliente = @get("model")
    cliente.setProperties data
    cliente.save().then @success, @failure
    @set "submitting", true
    false
