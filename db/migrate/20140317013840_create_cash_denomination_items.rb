class CreateCashDenominationItems < ActiveRecord::Migration
  def change
    create_table :cash_denomination_items do |t|
      t.references :cash_denomination, null: false
      t.references :cierre_caja, null: false
      t.integer :cantidad, null: false
      t.datetime "created_at"
    end
    add_index :cash_denomination_items, [:cash_denomination_id, :cierre_caja_id], name: "cash_denomination_items"
  end
end
