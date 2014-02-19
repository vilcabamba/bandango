class CompraSerializer < OrderableSerializer

  attributes :retencion_iva_bienes,
             :retencion_iva_servicios,
             :retencion_iva_cien,
             :base_imponible_renta,
             :porcentaje_retencion_fuente,
             :numero_serie_retencion_establecimiento,
             :numero_serie_retencion_punto_emision,
             :numero_serie_retencion,
             :numero_autorizacion_retencion,
             :fecha_emision_retencion,
             :created_at

  has_one :sustento_comprobante, embed: :ids, include: true

end
