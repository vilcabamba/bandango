Bandango.Category = DS.Model.extend
  nombre: DS.attr()

  items:  DS.hasMany("item")
