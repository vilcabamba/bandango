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

# relationships
  has_many :ventas

# serializations
  serialize :codigo_secuenciales, Array
  serialize :sustento_tributario, Array

end
