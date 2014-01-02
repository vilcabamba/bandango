Bandango.VentasNewView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin,
  bindAttributesTo: null

  submit: ->
    console.log "submit!"
    false
