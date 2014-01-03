class ItemSerializer < ActiveModel::Serializer

  attributes :id,
             :nombre,
             :descripcion,
             :precio,
             :category_id

end
