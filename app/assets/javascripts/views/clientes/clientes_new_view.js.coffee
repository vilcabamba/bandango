Bandango.ClientesNewView = Ember.View.extend
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Otro"]

  submit: ->
    console.log "submit!"
    false
