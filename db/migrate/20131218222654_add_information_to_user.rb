class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :nombres, :string
    add_column :users, :imagen, :string
  end
end
