Bandango.OrderItem = DS.Model.extend
  cantidad:         DS.attr("number")
  cachedItemPrecio: DS.attr()
  cachedItemNombre: DS.attr()

  item:             DS.belongsTo("item")
  venta:            DS.belongsTo("venta")
  compra:           DS.belongsTo("compra")
