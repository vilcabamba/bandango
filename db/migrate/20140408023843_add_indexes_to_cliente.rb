class AddIndexesToCliente < ActiveRecord::Migration
  def change
    add_index :clientes, :nombres
    add_index :clientes, :email
  end
end
