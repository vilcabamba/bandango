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
  retenciones:   DS.hasMany("retencion")

  rollbackAssociations: ->
    for orderItem in @get("orderItems.content").filterBy("isDirty")
      orderItem.rollback()
    @get("cliente").rollback() if @get("cliente.isDirty")
