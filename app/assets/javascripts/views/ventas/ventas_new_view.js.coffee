Bandango.VentasNewView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin,
  bindAttributesTo: null

  modelBinding: "controller.model"

  submit: ->
    console.log "submit!"
    false
