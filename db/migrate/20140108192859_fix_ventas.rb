class FixVentas < ActiveRecord::Migration
  def up
    change_table :ventas do |t|
      t.remove :base_no_iva,
               :base_iva_zero,
               :base_iva,
               :monto_iva,
               :iva_retenido,
               :renta_retenido
    end
  end
  def down
    change_table :ventas do |t|
      t.float :base_no_iva
      t.float :base_iva_zero
      t.float :base_iva
      t.float :monto_iva
      t.float :iva_retenido
      t.float :renta_retenido
    end
  end
end
