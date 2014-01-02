Bandango.ComprobanteOnFormMixin = Ember.Mixin.create
  comprobantes: (->
    Bandango.comprobantesHelper.comprobantes
  ).property()
