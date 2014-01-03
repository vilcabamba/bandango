Bandango.Comprobante = DS.Model.extend
  codigo: DS.attr()
  tipo:   DS.attr()

  ventas: DS.hasMany("venta")
