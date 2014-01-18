class RenameObligadoALlevarContabilidad < ActiveRecord::Migration
  def up
    change_table :emisores do |t|
      t.rename :obligado_a_llevar_contabilidad, :obligado_llevar_contabilidad
    end
  end
  def down
    change_table :emisores do |t|
      t.rename :obligado_llevar_contabilidad, :obligado_a_llevar_contabilidad
    end
  end
end
