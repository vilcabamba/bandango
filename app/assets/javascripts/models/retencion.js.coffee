Bandango.Retencion = DS.Model.extend Bandango.RetencionBaseMixin,
  fechaEmision:               DS.attr()
  numeroAutorizacion:         DS.attr()
  numeroSerieEstablecimiento: DS.attr()
  numeroSeriePuntoEmision:    DS.attr()
  numeroSerieSecuencial:      DS.attr()

  conceptoRetencionFuente:    DS.belongsTo("conceptoRetencionFuente")
  compra:                     DS.belongsTo("compra")
  venta:                      DS.belongsTo("venta")
