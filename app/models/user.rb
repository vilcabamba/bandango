class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include Validations
  include Tokenizable
  include GravatarImagen

end
