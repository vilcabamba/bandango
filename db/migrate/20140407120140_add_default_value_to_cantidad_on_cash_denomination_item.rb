class AddDefaultValueToCantidadOnCashDenominationItem < ActiveRecord::Migration
  def up
    change_table :cash_denomination_items do |t|
      t.change :cantidad, :integer, null: false, default: 0
    end
  end

  def down
    change_table :cash_denomination_items do |t|
      t.change :cantidad, :integer, null: false, default: nil
    end
  end
end
