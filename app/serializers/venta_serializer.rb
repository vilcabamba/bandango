class VentaSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at

  has_one :cliente, key: :cliente_id, embed: :ids, include: true
  has_one :comprobante, key: :comprobante_id, embed: :ids, include: true

end
