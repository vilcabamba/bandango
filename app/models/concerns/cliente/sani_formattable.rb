class Cliente < ActiveRecord::Base
  module SaniFormattable
    
    def sani_attributes
      @@sani_attributes ||= [:tipo_id, :identificacion, :nombres, :direccion, :telefono, :email]
    end
  end
end
