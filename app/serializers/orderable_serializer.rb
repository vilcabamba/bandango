class OrderableSerializer < ActiveModel::Serializer

  has_one :cliente, embed: :ids, include: true
  has_one :comprobante, embed: :ids, include: true
  has_many :order_items, embed: :ids, include: true
  has_many :retenciones, embed: :ids, include: true

end
