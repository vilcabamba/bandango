class RetencionSerializer < ActiveModel::Serializer

  attributes :id,
             :fecha_emision,
             :numero_retencion,
             :numero_autorizacion,
             :iva,
             :tarifa_iva,
             :ice,
             :tarifa_ice

  has_one :concepto_retencion_fuente, key: :concepto_retencion_fuente_id, embed: :ids, include: true

end
