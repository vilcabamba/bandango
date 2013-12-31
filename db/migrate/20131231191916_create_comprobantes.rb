class CreateComprobantes < ActiveRecord::Migration
  def change
    create_table :comprobantes do |t|
      t.integer :codigo, null: false
      t.string :tipo,    null: false
      t.text :codigo_secuenciales # Código Secuenciales Transacción
      t.text :sustento_tributario # Sustento tributario
    end
    add_index :comprobantes, :codigo, unique: true
  end
end
