Bandango.Retencion = DS.Model.extend
  fechaEmision:            DS.attr()
  numeroRetencion:         DS.attr()
  numeroAutorizacion:      DS.attr()
  iva:                     DS.attr()
  tarifaIva:               DS.attr()
  ice:                     DS.attr()
  tarifaIce:               DS.attr()

  conceptoRetencionFuente: DS.belongsTo("conceptoRetencionFuente")
