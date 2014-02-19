class AddOrderTypeToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :order_type, :string, null: false
    add_index :order_items, [:order_id, :order_type]
  end
end
