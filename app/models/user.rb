class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include Validations

end
