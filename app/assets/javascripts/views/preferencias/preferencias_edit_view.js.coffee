Bandango.PreferenciasEditView = Bandango.ModelBackedView.extend
  attributes: ["ruc", "razonSocial", "nombreComercial", "direccionMatriz", "direccionEstablecimiento", "codigoEstablecimiento", "codigoPuntoEmision", "contribuyenteEspecialNumeroResolucion", "obligadoLlevarContabilidad", "imagenUrl"]
  modelBinding: "controller.model"

  success: ->
    @successCallback "actualizado"
    @get("controller").transitionTo "preferencias.index"

  failure: (response) ->
    @get("model").rollback()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    model = @get("model")
    model.setProperties data
    model.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
