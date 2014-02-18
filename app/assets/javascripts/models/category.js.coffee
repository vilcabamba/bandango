Bandango.Category = DS.Model.extend
  nombre:     DS.attr()
  itemsCount: DS.attr()

  items:      DS.hasMany("item")
