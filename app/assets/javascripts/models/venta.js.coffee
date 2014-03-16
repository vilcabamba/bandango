Bandango.Venta = DS.Model.extend Bandango.OrderItemsMixin,
  numeroSerieEstablecimiento: DS.attr()
  numeroSeriePuntoEmision:    DS.attr()
  numeroSerieComprobante:     DS.attr()
  fechaEmision:               DS.attr()
  fechaRegistro:              DS.attr()
  createdAt:                  DS.attr()
  autorizacionComprobante:    DS.attr()
  formaDePago:                DS.attr()

  cliente:                    DS.belongsTo("cliente")
  comprobante:                DS.belongsTo("comprobante")
  orderItems:                 DS.hasMany("orderItem")
  retenciones:                DS.hasMany("retencion")
