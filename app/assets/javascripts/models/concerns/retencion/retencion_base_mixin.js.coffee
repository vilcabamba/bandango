Bandango.RetencionBaseMixin = Ember.Mixin.create
  setIva: (->
    iva = @get("compra.ivaTwelve") * (@get("tarifaIva") / 100)
    @set "iva", iva
  ).observes("tarifaIva", "compra.ivaTwelve")

  setIce: (->
    ice = @get("compra.ice") * (@get("tarifaIce") / 100)
    @set "ice", ice
  ).observes("tarifaIce", "compra.ice")

  setTarifas: (->
    porcentaje = @get("conceptoRetencionFuente.porcentaje")
    @set "tarifaIva", porcentaje
    @set "tarifaIce", porcentaje
  ).observes("conceptoRetencionFuente")
