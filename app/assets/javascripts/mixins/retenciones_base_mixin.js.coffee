Bandango.RetencionesBaseMixin = Ember.Mixin.create

  persistedRetenciones: (->
    Ember.debug "computing persistedRetenciones"
    @get("retenciones").filterBy "isNew", false
  ).property("retenciones.@each")
