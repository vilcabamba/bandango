Bandango.comprobantesHelper =
  comprobantes: undefined

  loadComprobantes: (store) ->
    unless @comprobantes
      store.findAll("comprobante").then (comprobantes) =>
        @comprobantes = comprobantes
