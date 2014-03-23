class CreateCierreCajas < ActiveRecord::Migration
  def change
    create_table :cierres_caja do |t|
      t.references :user, null: false
      t.text :totales
      t.money :fondo_anterior
      t.money :efectivo_compras
      t.money :iva_compras
      t.money :ice_compras
      t.money :efectivo_ventas
      t.money :iva_ventas
      t.money :ice_ventas
      t.money :efectivo_teorico
      t.money :efectivo_real
      t.money :retiro
      t.timestamps
    end
    add_index :cierres_caja, :user_id
  end
end
