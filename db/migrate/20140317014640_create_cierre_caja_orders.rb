class CreateCierreCajaOrders < ActiveRecord::Migration
  def change
    create_table :cierre_caja_orders do |t|
      t.references :cierre_caja, null: false
      t.integer :order_id, null: false
      t.string :order_type, null: false
      t.timestamps
    end
    add_index :cierre_caja_orders, [:cierre_caja_id, :order_id, :order_type], name: "cierre_cajas_orders"
    add_index :cierre_caja_orders, [:order_id, :order_type], name: "cierre_caja_orderable"
  end
end
