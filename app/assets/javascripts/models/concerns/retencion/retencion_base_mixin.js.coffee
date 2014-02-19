Bandango.RetencionBaseMixin = Ember.Mixin.create
  parent: (->
    @get("compra") or @get("venta")
  ).property("compra", "venta")

  numeroDeSerie: (->
    "#{@get("numeroSerieEstablecimiento")}-#{@get("numeroSeriePuntoEmision")}-#{@get("numeroSerieSecuencial")}"
  ).property()

  iva: (->
    @get("parent.ivaTwelve") * (@get("tarifaIva") / 100)
  ).property("tarifaIva", "parent.ivaTwelve")

  ice: (->
    @get("parent.ice") * (@get("tarifaIce") / 100)
  ).property("tarifaIce", "parent.ice")

  tarifaIva: (->
    @get("conceptoRetencionFuente.porcentaje")
  ).property("conceptoRetencionFuente.porcentaje")

  tarifaIce: (->
    @get("tarifaIva")
  ).property("tarifaIva")
