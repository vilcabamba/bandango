class ItemSerializer < ActiveModel::Serializer

  attributes :id,
             :nombre,
             :descripcion,
             :se_vende,
             :base_venta,
             :se_compra,
             :base_compra,
             :iva,
             :iva_tarifa,
             :ice,
             :ice_tarifa,
             :category_id

end
