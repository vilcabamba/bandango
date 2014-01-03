class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category,    null: false, default: 1
      t.string     :nombre,      null: false
      t.string     :descripcion
      t.float      :precio,      null: false

      t.timestamps
    end
  end
end
