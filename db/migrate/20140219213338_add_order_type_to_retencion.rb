class AddOrderTypeToRetencion < ActiveRecord::Migration
  def change
    add_column :retenciones, :order_type, :string, null: false
    add_index :retenciones, [:order_id, :order_type]
  end
end
