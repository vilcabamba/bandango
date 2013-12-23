self = null

Bandango.ClientesEditView = Bandango.ModelBackedView.extend
  tiposIds: ["RUC", "Cédula", "Otro"]
  templateName: "clientes/new"
  modelBinding: "controller.model"

  attributes: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  success: (cliente) ->
    alertify.log "Cliente actualizado"
    self.get("controller").transitionToRoute "clientes.show", cliente.get("id")

  failure: (response) ->
    self.setErrors response.errors
    self.set "submitting", false

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    cliente = @get("model")
    cliente.setProperties data
    cliente.save().then @success, @failure
    @set "submitting", true
    false
