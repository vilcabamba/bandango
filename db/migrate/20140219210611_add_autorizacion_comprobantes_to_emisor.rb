class AddAutorizacionComprobantesToEmisor < ActiveRecord::Migration
  def change
    add_column :emisores, :autorizacion_comprobantes, :string
  end
end
