class CreateVenta < ActiveRecord::Migration
  def change
    create_table :ventas do |t|
      t.references :cliente,     null: false
      t.references :comprobante, null: false
      t.float :base_no_iva,      null: false  # baseNoGraIva
      t.float :base_iva_zero,    null: false  # baseImponible
      t.float :base_iva,         null: false  # baseImpGrav
      t.float :monto_iva,        null: false  # montoIva
      t.float :iva_retenido,     null: false  # valorRetIva
      t.float :renta_retenido,   null: false  # valorRetRenta

      t.timestamps
    end
    add_index :ventas, :cliente_id
    add_index :ventas, :comprobante_id
  end
end
