class RetencionSerializer < ActiveModel::Serializer

  attributes :id,
             :fecha_emision,
             :numero_autorizacion,
             :numero_serie_establecimiento,
             :numero_serie_punto_emision,
             :numero_serie_secuencial,
             :iva,
             :tarifa_iva,
             :ice,
             :tarifa_ice

  has_one :concepto_retencion_fuente, key: :concepto_retencion_fuente_id, embed: :ids, include: true

end
