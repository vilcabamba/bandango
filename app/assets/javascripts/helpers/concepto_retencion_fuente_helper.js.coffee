Bandango.conceptoRetencionFuenteHelper =
  comprobantes: undefined

  loadComprobantes: (store) ->
    unless @comprobantes
      store.findAll("conceptoRetencionFuente").then (comprobantes) =>
        @comprobantes = comprobantes
