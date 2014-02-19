Bandango.SustentoComprobante = DS.Model.extend
  codigo: DS.attr()
  tipo:   DS.attr()

  compras:    DS.hasMany("compra")
