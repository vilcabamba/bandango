Bandango.Compra = DS.Model.extend Bandango.OrderItemsMixin,

  sustentoComprobante: DS.belongsTo("sustentoComprobante")
  orderItems:          DS.hasMany("orderItem")
