class CreateEmisores < ActiveRecord::Migration
  def change
    create_table :emisores do |t|
      t.string :ruc,                       null: false
      t.string :razon_social,              null: false
      t.string :nombre_comercial
      t.string :direccion_matriz,          null: false
      t.string :direccion_establecimiento, null: false
      t.string :codigo_establecimiento,    null: false
      t.string :codigo_punto_emision,      null: false
      t.string :contribuyente_especial_numero_resolucion
      t.boolean :obligado_a_llevar_contabilidad
      t.string :logo

      t.timestamps
    end
    add_index :emisores, :ruc, unique: true
  end
end
