class ChangeConceptoRetencionFuentesTable < ActiveRecord::Migration
  def change
    rename_table :concepto_retencion_fuentes, :conceptos_retencion_fuente
  end
end
