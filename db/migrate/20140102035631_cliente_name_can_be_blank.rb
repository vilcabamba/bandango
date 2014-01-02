class ClienteNameCanBeBlank < ActiveRecord::Migration
  def up
    change_table :clientes do |t|
      t.change :nombres, :string, null: true
    end
  end
  def down
    change_table :clientes do |t|
      t.change :nombres, :string, null: false
    end
  end
end
