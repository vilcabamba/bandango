# == Schema Information
#
# Table name: comprobantes
#
#  id                  :integer          not null, primary key
#  codigo              :integer          not null
#  tipo                :string(255)      not null
#  codigo_secuenciales :text
#  sustento_tributario :text
#

class Comprobante < ActiveRecord::Base
  include Caching
  include Validations

# relationships
  has_many :ventas
  has_many :compras

# serializations
  serialize :codigo_secuenciales, Array
  serialize :sustento_tributario, Array

end
