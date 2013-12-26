class Cliente < ActiveRecord::Base
  include Cacheable
  include Validations
  include GravatarImagen

end
