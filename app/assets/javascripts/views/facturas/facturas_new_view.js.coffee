Bandango.FacturasNewView = Ember.View.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

  submit: ->
    console.log "submit!"
    false
