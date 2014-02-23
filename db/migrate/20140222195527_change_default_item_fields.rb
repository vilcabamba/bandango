class ChangeDefaultItemFields < ActiveRecord::Migration
  def change
    change_column_default :items, :iva, nil
    change_column_default :items, :ice, nil
    change_column :items, :ice_tarifa, :integer, default: 15
  end
end
