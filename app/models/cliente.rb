class Cliente < ActiveRecord::Base
  include Cacheable
  include Validations
  include IdValidations
  include GravatarImagen

end
