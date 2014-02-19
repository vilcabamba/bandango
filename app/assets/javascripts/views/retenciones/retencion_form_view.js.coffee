Bandango.RetencionFormView = Bandango.ModelBackedView.extend Bandango.RetencionFuenteOnFormMixin,
  tagName: "div"
  templateName: "retenciones/form"
  controllerModelBinding: "controller.model"
  attributes: [ "numeroAutorizacion",
                "numeroSerieEstablecimiento",
                "numeroSeriePuntoEmision",
                "numeroSerieSecuencial",
                "fechaEmision",
                "conceptoRetencionFuente",
                "compra",
                "venta" ]

  compra: (->
    @get("controllerModel") unless @get("controllerModel.isVenta")
  ).property("controllerModel")

  venta: (->
    @get("controllerModel") if @get("controllerModel.isVenta")
  ).property("controllerModel")

  newConceptoRetencion: (conceptoRetencionFuente) ->
    @_super conceptoRetencionFuente
    @set "conceptoRetencionFuente", conceptoRetencionFuente

  model: (->
    model = @get("controller.model")
    store = @get("controller.store")
    properties = { inForm: true }
    properties[model.get("modelName").decamelize()] = model
    store.createRecord "retencion", properties
  ).property("controller.model")

  actions:
    addRetencion: ->
      @get("controller.store").createRecord "retencion", @getFormData()
