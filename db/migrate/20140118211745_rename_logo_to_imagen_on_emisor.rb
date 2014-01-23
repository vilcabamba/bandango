class RenameLogoToImagenOnEmisor < ActiveRecord::Migration
  def up
    change_table :emisores do |t|
      t.rename :logo, :imagen
    end
  end
  def down
    change_table :emisores do |t|
      t.rename :imagen, :logo
    end
  end
end
