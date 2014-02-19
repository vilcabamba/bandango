Bandango.RetencionBaseMixin = Ember.Mixin.create
  parent: (->
    @get("compra") or @get("venta")
  ).property("compra", "venta")

  setIva: (->
    iva = @get("parent.ivaTwelve") * (@get("tarifaIva") / 100)
    @set "iva", iva
  ).observes("tarifaIva", "parent.ivaTwelve")

  setIce: (->
    ice = @get("parent.ice") * (@get("tarifaIce") / 100)
    @set "ice", ice
  ).observes("tarifaIce", "parent.ice")

  setTarifas: (->
    porcentaje = @get("conceptoRetencionFuente.porcentaje")
    @set "tarifaIva", porcentaje
    @set "tarifaIce", porcentaje
  ).observes("conceptoRetencionFuente")
