Bandango.RetencionFuenteOnFormMixin = Ember.Mixin.create
  conceptosRetencionFuente: (->
    Bandango.conceptoRetencionFuenteHelper.comprobantes
  ).property()

  conceptoSelectChanged: (e) ->
    @get("controller.store").find("conceptoRetencionFuente", e.target.value).then (retencionFuente) =>
      @set "model.conceptoRetencionFuente", retencionFuente

  didInsertElement: ->
    @_super()
    @$(".retencion_fuente_select").chosen().on("change", $.proxy(@conceptoSelectChanged, @)).trigger("change")

  willDestroyElement: ->
    @_super()
    @$(".retencion_fuente_select").chosen("destroy").off("change")
