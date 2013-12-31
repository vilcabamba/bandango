class Comprobante < ActiveRecord::Base

# relationships
  belongs_to :venta

# serializations
  serialize :codigo_secuenciales, Array
  serialize :sustento_tributario, Array

end
