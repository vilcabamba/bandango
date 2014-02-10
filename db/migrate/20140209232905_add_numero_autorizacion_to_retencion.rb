class AddNumeroAutorizacionToRetencion < ActiveRecord::Migration
  def change
    add_column :retenciones, :numero_autorizacion, :string
  end
end
