class Venta < ActiveRecord::Base
  self.table_name = :ventas
# relationships
  belongs_to :cliente
  
end
