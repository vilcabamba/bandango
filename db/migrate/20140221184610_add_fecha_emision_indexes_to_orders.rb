class AddFechaEmisionIndexesToOrders < ActiveRecord::Migration
  def change
    add_index :ventas, :fecha_emision
    add_index :compras, :fecha_emision
  end
end
