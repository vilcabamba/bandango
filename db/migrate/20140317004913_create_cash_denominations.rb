class CreateCashDenominations < ActiveRecord::Migration
  def change
    create_table :cash_denominations do |t|
      t.decimal :price, null: false, precision: "10,2"
      t.string :kind, null: false
    end
    add_index :cash_denominations, [:price, :kind], unique: true
  end
end
