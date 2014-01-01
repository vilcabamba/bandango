class VentaSerializer < ActiveModel::Serializer

  attributes :id,
             :base_no_iva,
             :base_iva_zero,
             :base_iva,
             :monto_iva,
             :iva_retenido,
             :renta_retenido,
             :created_at

  has_one :cliente, key: :cliente_id, embed: :ids, include: true
  has_one :comprobante, key: :comprobante_id, embed: :ids, include: true

end
