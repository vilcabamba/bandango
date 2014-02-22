class ChangeAutorizacionTypeFields < ActiveRecord::Migration
  def change
    change_column :compras, :autorizacion_comprobante, :string
    change_column :compras, :numero_autorizacion_comprobante_modificado, :string
  end
end
