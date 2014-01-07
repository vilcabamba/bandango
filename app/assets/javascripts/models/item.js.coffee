Bandango.Item = DS.Model.extend Bandango.ItemBaseMixin,
  nombre:      DS.attr()
  descripcion: DS.attr()
  base:        DS.attr()
  iva:         DS.attr()
  ivaTarifa:   DS.attr()
  ice:         DS.attr()
  iceTarifa:   DS.attr()

  orderItems:  DS.hasMany("orderItem")
  category:    DS.belongsTo("category")
