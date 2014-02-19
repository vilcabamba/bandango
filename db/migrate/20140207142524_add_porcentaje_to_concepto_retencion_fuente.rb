class AddPorcentajeToConceptoRetencionFuente < ActiveRecord::Migration
  def change
    add_column :concepto_retencion_fuentes, :porcentaje, :float
  end
end
