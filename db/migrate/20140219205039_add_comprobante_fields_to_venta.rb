class AddComprobanteFieldsToVenta < ActiveRecord::Migration
  def change
    add_column :ventas, :numero_serie_establecimiento, :string
    add_column :ventas, :numero_serie_punto_emision, :string
    add_column :ventas, :numero_serie_comprobante, :string
    add_column :ventas, :fecha_emision, :date
    add_column :ventas, :fecha_registro, :date
    add_column :ventas, :autorizacion_comprobante, :string
  end
end
