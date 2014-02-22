class ChangeRetencionesFechaEmisionDefault < ActiveRecord::Migration
  def change
    change_column_default :retenciones, :fecha_emision, nil
  end
end
