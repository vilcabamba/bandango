Bandango.Venta = DS.Model.extend Bandango.OrderItemsMixin,
  baseNoIva:     DS.attr()
  baseIvaZero:   DS.attr()
  baseIva:       DS.attr()
  montoIva:      DS.attr()
  ivaRetenido:   DS.attr()
  rentaRetenido: DS.attr()
  createdAt:     DS.attr()

  cliente:       DS.belongsTo("cliente")
  comprobante:   DS.belongsTo("comprobante")
  orderItems:    DS.hasMany("orderItem")

  rollback: ->
    for orderItem in @get("orderItems.content")
      orderItem.rollback() if orderItem.get("isDirty")
    @_super()

Ember.Inflector.inflector.irregular('venta', 'ventas');
Ember.Inflector.inflector.singular(/venta/, 'venta');
