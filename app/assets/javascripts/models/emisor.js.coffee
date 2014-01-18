Bandango.Emisor = DS.Model.extend
  ruc:                                   DS.attr()
  razonSocial:                           DS.attr()
  nombreComercial:                       DS.attr()
  direccionMatriz:                       DS.attr()
  direccionEstablecimiento:              DS.attr()
  codigoEstablecimiento:                 DS.attr()
  codigoPuntoEmision:                    DS.attr()
  contribuyenteEspecialNumeroResolucion: DS.attr()
  obligadoALlevarContabilidad:           DS.attr()
  imagenUrl:                             DS.attr()

Ember.Inflector.inflector.irregular("emisor", "emisores")
