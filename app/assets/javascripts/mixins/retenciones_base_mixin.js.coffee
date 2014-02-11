Bandango.RetencionesBaseMixin = Ember.Mixin.create

  persistedRetenciones: (->
    Ember.debug "computing persistedRetenciones"
    @get("retenciones").rejectBy "inForm"
  ).property("retenciones.@each")
