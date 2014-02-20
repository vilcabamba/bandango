Bandango.ComprobanteOnFormMixin = Ember.Mixin.create
  comprobantes: (->
    Bandango.comprobantesHelper.comprobantes
  ).property()

  comprobanteSelectChanged: (e) ->
    @get("controller.store").find("comprobante", e.target.value).then (comprobante) =>
      @set "model.comprobante", comprobante

  didInsertElement: ->
    @_super()
    $select = @$(".comprobante_select")
    if @get("model") and id = @get("model.comprobante.id")
      $select.val id
    $select.chosen().on("change", $.proxy(@comprobanteSelectChanged, @)).trigger("change")

  willDestroyElement: ->
    @_super()
    @$(".comprobante_select").chosen("destroy").off("change")
