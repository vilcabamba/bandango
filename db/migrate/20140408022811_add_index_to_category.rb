class AddIndexToCategory < ActiveRecord::Migration
  def change
    add_index :categories, :nombre
  end
end
