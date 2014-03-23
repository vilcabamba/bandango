Bandango.RetencionSerializer = Bandango.ApplicationSerializer.extend
  serialize: (retencion, options) ->
    unless retencion.get("inForm")
      {
        concepto_retencion_fuente_id: retencion.get("conceptoRetencionFuente.id")
        numero_autorizacion: retencion.get("numeroAutorizacion")
        numero_serie_establecimiento: retencion.get("numeroSerieEstablecimiento")
        numero_serie_punto_emision: retencion.get("numeroSeriePuntoEmision")
        numero_serie_secuencial: retencion.get("numeroSerieSecuencial")
        fecha_emision: retencion.get("fechaEmision")
      }
