Bandango.ComprobanteOnFormMixin = Ember.Mixin.create
  comprobantes: (->
    Bandango.comprobantesHelper.comprobantes
  ).property()

  didInsertElement: ->
    @_super()
    @$(".comprobante_select").chosen()

  willDestroyElement: ->
    @_super()
    @$(".comprobante_select").chosen "destroy"
