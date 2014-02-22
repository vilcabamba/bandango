class CacheMoreItemFieldsOnOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :cached_item_iva, :boolean
    add_column :order_items, :cached_item_ice, :boolean
    add_column :order_items, :cached_item_iva_tarifa, :integer
    add_column :order_items, :cached_item_ice_tarifa, :integer
  end
end
