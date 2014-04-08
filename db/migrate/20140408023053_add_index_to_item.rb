class AddIndexToItem < ActiveRecord::Migration
  def change
    add_index :items, :nombre
  end
end
