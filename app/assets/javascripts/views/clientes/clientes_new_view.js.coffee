Bandango.ClientesNewView = Ember.View.extend
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Otro"]

  success: ->
    console.log "success"

  failure: ->
    console.log "failure"

  submit: ->
    data = @getProperties "tipoId", "identificacion", "nombres", "direccion", "telefono", "email"
    store = @get("controller").get("store")
    new_cliente = store.createRecord "cliente", data
    new_cliente.save().then @success, @failure
    @set "submitting", true
    false
