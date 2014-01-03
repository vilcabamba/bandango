Bandango.ComprobanteOnFormMixin = Ember.Mixin.create
  comprobantes: (->
    Bandango.comprobantesHelper.comprobantes
  ).property()

  comprobanteSelectChanged: (e) ->
    @set "comprobanteId", e.target.value

  didInsertElement: ->
    @_super()
    @$(".comprobante_select").chosen().on "change", $.proxy(@comprobanteSelectChanged, @)

  willDestroyElement: ->
    @_super()
    @$(".comprobante_select").chosen("destroy").off("change")
