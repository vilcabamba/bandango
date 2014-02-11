Bandango.Retencion = DS.Model.extend Bandango.RetencionBaseMixin,
  fechaEmision:            DS.attr()
  numeroRetencion:         DS.attr()
  numeroAutorizacion:      DS.attr()
  iva:                     DS.attr()
  tarifaIva:               DS.attr()
  ice:                     DS.attr()
  tarifaIce:               DS.attr()

  conceptoRetencionFuente: DS.belongsTo("conceptoRetencionFuente")
  compra:                  DS.belongsTo("compra")
