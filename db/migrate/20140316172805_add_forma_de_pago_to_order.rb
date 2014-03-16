class AddFormaDePagoToOrder < ActiveRecord::Migration
  def up
    change_table :compras do |t|
      t.string :forma_de_pago, null: false, default: "Efectivo"
    end
    add_index :compras, :forma_de_pago

    change_table :ventas do |t|
      t.string :forma_de_pago, null: false, default: "Efectivo"
    end
    add_index :ventas, :forma_de_pago
  end
end
