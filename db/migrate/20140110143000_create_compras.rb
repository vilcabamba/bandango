class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.references :sustento_comprobante, null: false
      t.references :cliente,              null: false
      t.references :comprobante,          null: false

      t.date :fecha_registro, null: false

      t.string :numero_serie_establecimiento, null: false
      t.string :numero_serie_punto_emision,   null: false
      t.string :numero_serie_comprobante,     null: false
      t.date :fecha_emision,              null: false
      t.integer :autorizacion_comprobante, null: false

      t.float :retencion_iva_bienes,    null: false, default: 0
      t.float :retencion_iva_servicios, null: false, default: 0
      t.float :retencion_iva_cien,      null: false, default: 0

      t.references :concepto_retencion_fuente
      t.float :base_imponible_renta
      t.integer :porcentaje_retencion_fuente

      t.string :numero_serie_retencion_establecimiento
      t.string :numero_serie_retencion_punto_emision
      t.string :numero_serie_retencion
      t.integer :numero_autorizacion_retencion

      t.date :fecha_emision_retencion

      t.references :comprobante_modificado
      t.string :numero_serie_comprobante_modificado_establecimiento
      t.string :numero_serie_comprobante_modificado_punto_emision
      t.string :numero_serie_comprobante_modificado
      t.integer :numero_autorizacion_comprobante_modificado

      t.timestamps
    end
    add_index :compras, :sustento_comprobante_id
    add_index :compras, :cliente_id
    add_index :compras, :comprobante_id
    add_index :compras, :concepto_retencion_fuente_id
  end
end
