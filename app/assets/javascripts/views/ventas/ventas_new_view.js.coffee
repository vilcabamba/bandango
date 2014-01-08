Bandango.VentasNewView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin, Bandango.ComprobanteOnFormMixin,
  bindAttributesTo: null

  modelBinding: "controller.model"

  success: (a) ->
    console.log a

  failure: (r) ->
    console.log r

  submit: ->
    @get("model").save().then $.proxy(@success, @), $.proxy(@failure, @)
    false
