class CreateConceptoRetencionFuentes < ActiveRecord::Migration
  def change
    create_table :concepto_retencion_fuentes do |t|
      t.string :codigo, null: false
      t.string :concepto, null: false

      t.timestamps
    end
    add_index :concepto_retencion_fuentes, :codigo, unique: true
  end
end
