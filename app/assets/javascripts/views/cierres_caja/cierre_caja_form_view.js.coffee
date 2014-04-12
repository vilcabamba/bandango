Bandango.CierreCajaFormView = Bandango.ModelBackedView.extend
  modelBinding: "controller.model"
  includeForm: true

  cierreCajaSaved: (cierreCaja) ->
    @get("controller").transitionToRoute "cierres_caja.show", cierreCaja.get("id")

  saveCierreCaja: ->
    @get("model").save().then $.proxy(@cierreCajaSaved, @), $.proxy(@failureSavingCierreCaja, @)

  submit: ->
    @saveCierreCaja()
    @set "submitting", true
    false
