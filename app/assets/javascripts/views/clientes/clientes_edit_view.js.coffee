self = null

Bandango.ClientesEditView = Bandango.ModelBackedView.extend
  tiposIds: ["RUC", "Cédula", "Otro"]
  templateName: "clientes/new"
  modelBinding: "controller.model"

  attributes: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    console.log data
    false
