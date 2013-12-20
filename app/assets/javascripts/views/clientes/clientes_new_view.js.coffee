Bandango.ClientesNewView = Ember.View.extend
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Otro"]

<<<<<<< HEAD
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
=======
  submit: ->
    console.log "submit!"
>>>>>>> 31691c72985ba0d5f12b512e39f6311a2e0e6eb9
    false
