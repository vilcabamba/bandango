class OrderItemSerializer < ActiveModel::Serializer
  
  attributes :id,
             :cantidad,
             :cached_item_precio,
             :cached_item_nombre

  has_one :item, key: :item_id, embed: :ids, include: true

end
