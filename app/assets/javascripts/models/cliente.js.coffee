Bandango.Cliente = DS.Model.extend Bandango.PersonImagen,
  tipoId:         DS.attr()
  identificacion: DS.attr()
  nombres:        DS.attr()
  direccion:      DS.attr()
  telefono:       DS.attr()
  email:          DS.attr()

  ventas:         DS.hasMany("venta")
