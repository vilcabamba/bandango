class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.references :sustento_comprobante, null: false
      t.references :cliente, null: false
      t.references :comprobante, null: false
      t.timestamps
    end
    add_index :compras, :sustento_comprobante_id
    add_index :compras, :cliente_id
    add_index :compras, :comprobante_id
  end
end
