self = null

Bandango.ClientesNewView = Bandango.ModelBackedView.extend
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Otro"]

  success: ->
    console.log "success"

  failure: (response) ->
    self.setErrors response.errors
    self.set "submitting", false

  submit: ->
    self = @
    @emptyErrors()
    data = @getProperties "tipoId", "identificacion", "nombres", "direccion", "telefono", "email"
    store = @get("controller").get("store")
    new_cliente = store.createRecord "cliente", data
    new_cliente.save().then @success, @failure
    @set "submitting", true
    false
