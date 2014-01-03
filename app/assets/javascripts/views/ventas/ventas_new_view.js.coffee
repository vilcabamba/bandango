Bandango.VentasNewView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin, Bandango.ItemOnFormMixin,
  bindAttributesTo: null

  submit: ->
    console.log "submit!"
    false
