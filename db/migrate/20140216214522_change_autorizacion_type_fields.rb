class ChangeAutorizacionTypeFields < ActiveRecord::Migration
  def change
    add_column :compras, :autorizacion_comprobante, :string
    add_column :compras, :numero_autorizacion_comprobante_modificado, :string
  end
end
