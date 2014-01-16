class AddSellablePropertiesToItem < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.boolean :se_vende
      t.rename :base, :base_venta
      t.change :base_venta, :float, null: true
      t.boolean :se_compra
      t.float :base_compra
    end
  end
  def down
    raise ActiveRecord::IrreversibleMigration, "Don't rollback this"
  end
end
