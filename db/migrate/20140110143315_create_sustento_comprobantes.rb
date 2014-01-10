class CreateSustentoComprobantes < ActiveRecord::Migration
  def change
    create_table :sustento_comprobantes do |t|
      t.integer :codigo, null: false
      t.string  :tipo,   null: false
      t.text    :codigo_tipo_comprobantes
      t.timestamps
    end
    add_index :sustento_comprobantes, :codigo, unique: true
  end
end
