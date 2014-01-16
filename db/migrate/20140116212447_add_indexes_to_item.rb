class AddIndexesToItem < ActiveRecord::Migration
  def change
    add_index :items, :se_vende
    add_index :items, :se_compra
  end
end
