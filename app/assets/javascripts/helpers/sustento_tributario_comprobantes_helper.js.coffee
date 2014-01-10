Bandango.sustentoTributarioComprobantesHelper =
  comprobantes: undefined

  loadComprobantes: (store) ->
    unless @comprobantes
      store.findAll("sustentoComprobante").then (comprobantes) =>
        @comprobantes = comprobantes
