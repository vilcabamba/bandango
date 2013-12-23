Bandango.FacturasNewView = Ember.View.extend
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

  submit: ->
    console.log "submit!"
    false
