class CreateRetenciones < ActiveRecord::Migration
  def change
    create_table :retenciones do |t|
      t.references :order, null: false
      t.references :concepto_retencion_fuente

      t.date :fecha_emision, null: false, default: Date.today
      t.string :numero_retencion, null: false

      t.boolean :iva
      t.integer :tarifa_iva

      t.boolean :ice
      t.integer :tarifa_ice

      t.timestamps
    end
    add_index :retenciones, :order_id
    add_index :retenciones, :concepto_retencion_fuente_id
  end
end
