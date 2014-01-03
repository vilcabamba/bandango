Bandango.Venta = DS.Model.extend
  baseNoIva:     DS.attr()
  baseIvaZero:   DS.attr()
  baseIva:       DS.attr()
  montoIva:      DS.attr()
  ivaRetenido:   DS.attr()
  rentaRetenido: DS.attr()
  createdAt:     DS.attr()

  cliente:       DS.belongsTo("cliente")
  comprobante:   DS.belongsTo("comprobante")

Ember.Inflector.inflector.irregular('venta', 'ventas');
