class ChangeRetencionFields < ActiveRecord::Migration
  def change
    change_table :retenciones do |t|
      t.remove :numero_retencion
      t.string :numero_serie_establecimiento
      t.string :numero_serie_punto_emision
      t.string :numero_serie_secuencial
    end
  end
end
