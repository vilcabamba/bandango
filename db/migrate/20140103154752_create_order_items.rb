class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item,               null: false
      t.references :order,              null: false
      t.integer    :cantidad,           null: false
      t.float      :cached_item_precio, null: false
      t.string     :cached_item_nombre, null: false

      t.timestamps
    end
    add_index :order_items, :item_id
    add_index :order_items, :order_id
  end
end
