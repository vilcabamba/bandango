class OrderableSerializer < ActiveModel::Serializer

  has_one :cliente, key: :cliente_id, embed: :ids, include: true
  has_one :comprobante, key: :comprobante_id, embed: :ids, include: true
  has_many :order_items, key: :order_item_ids, embed: :ids, include: true
  has_many :retenciones, key: :retencion_ids, embed: :ids, include: true

end
