class RemoveTaxesFieldsFromRetencion < ActiveRecord::Migration
  def up
    change_table :retenciones do |t|
      t.remove :iva,
               :ice,
               :tarifa_iva,
               :tarifa_ice
    end
  end
  def down
    change_table :retenciones do |t|
      t.boolean :iva
      t.boolean :ice
      t.integer :tarifa_iva
      t.integer :tarifa_ice
    end
  end
end
