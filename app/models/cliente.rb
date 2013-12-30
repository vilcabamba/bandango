# == Schema Information
#
# Table name: clientes
#
#  id             :integer          not null, primary key
#  tipo_id        :string(255)      default("Cédula"), not null
#  identificacion :string(255)      not null
#  nombres        :string(255)      not null
#  direccion      :string(255)
#  telefono       :string(255)
#  email          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Cliente < ActiveRecord::Base
  include Cacheable
  include Validations
  include IdValidations
  include GravatarImagen

end
