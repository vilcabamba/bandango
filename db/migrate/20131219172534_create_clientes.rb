# encoding: utf-8
class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :tipo_id, null: false, default: "Cédula"
      t.string :identificacion, null: false
      t.string :nombres, null: false
      t.string :direccion
      t.string :telefono
      t.string :email
    end
    add_index :clientes, :identificacion, unique: true
  end
end
