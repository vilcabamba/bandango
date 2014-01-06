class ItemSerializer < ActiveModel::Serializer

  attributes :id,
             :nombre,
             :descripcion,
             :base,
             :iva,
             :iva_tarifa,
             :ice,
             :ice_tarifa,
             :category_id

end
