class RemoveImagenFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :imagen, :string
  end
end
