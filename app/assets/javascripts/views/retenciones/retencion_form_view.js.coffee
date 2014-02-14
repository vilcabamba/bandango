Bandango.RetencionFormView = Bandango.ModelBackedView.extend Bandango.RetencionFuenteOnFormMixin,
  tagName: "div"
  templateName: "retenciones/form"
  compraBinding: "controller.model"
  attributes: [ "numeroAutorizacion",
                "numeroSerieEstablecimiento",
                "numeroSeriePuntoEmision",
                "numeroSerieSecuencial",
                "fechaEmision",
                "conceptoRetencionFuente",
                "compra" ]

  newConceptoRetencion: (conceptoRetencionFuente) ->
    @_super conceptoRetencionFuente
    @set "conceptoRetencionFuente", conceptoRetencionFuente

  model: (->
    compra = @get("controller.model")
    store = @get("controller.store")
    store.createRecord("retencion", compra: compra, inForm: true)
  ).property("controller.model")

  actions:
    addRetencion: ->
      @get("controller.store").createRecord "retencion", @getFormData()
