Bandango.Item = DS.Model.extend
  nombre:      DS.attr()
  descripcion: DS.attr()
  seVende:     DS.attr()
  baseVenta:   DS.attr()
  seCompra:    DS.attr()
  baseCompra:  DS.attr()
  iva:         DS.attr()
  ivaTarifa:   DS.attr()
  ice:         DS.attr()
  iceTarifa:   DS.attr()

  orderItems:  DS.hasMany("orderItem")
  category:    DS.belongsTo("category")
