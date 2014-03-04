# == Schema Information
#
# Table name: clientes
#
#  id             :integer          not null, primary key
#  tipo_id        :string(255)      default("Cédula"), not null
#  identificacion :string(255)      not null
#  nombres        :string(255)
#  direccion      :string(255)
#  telefono       :string(255)
#  email          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Cliente < ActiveRecord::Base
  include Cacheable
  include Searchable
  include Validations
  include SaniSyncable
  include IdValidations
  include GravatarImagen
  include SaniFormattable

# relationships
  has_many :ventas
  has_many :compras

end
