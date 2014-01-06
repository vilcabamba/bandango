class FixMissingFieldsInItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename  :precio,     :base
      t.boolean :iva,        default: true
      t.integer :iva_tarifa, default: 12
      t.boolean :ice,        default: false
      t.integer :ice_tarifa
    end
  end
end
