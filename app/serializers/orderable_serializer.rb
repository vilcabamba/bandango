class OrderableSerializer < ActiveModel::Serializer

  attributes :id,
             :created_at,
             :fecha_registro,
             :fecha_emision,
             :numero_serie_establecimiento,
             :numero_serie_punto_emision,
             :numero_serie_comprobante,
             :autorizacion_comprobante,
             :forma_de_pago


  has_one :cliente, embed: :ids, include: true
  has_one :comprobante, embed: :ids, include: true
  has_many :order_items, embed: :ids, include: true
  has_many :retenciones, embed: :ids, include: true

end
