self = null

Bandango.ClientesNewView = Bandango.ModelBackedView.extend
  tiposIds: ["RUC", "Cédula", "Otro"]
  bindAttributesTo: null

  success: ->
    console.log "success"

  failure: (response) ->
    self.setErrors response.errors
    self.set "submitting", false

  submit: ->
    self = @
    @emptyErrors()
    data = @getFormData()
    store = @get("controller").get("store")
    new_cliente = store.createRecord "cliente", data
    new_cliente.save().then @success, @failure
    @set "submitting", true
    false
