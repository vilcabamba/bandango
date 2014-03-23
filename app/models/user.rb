# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)      not null
#  email            :string(255)
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  token            :string(255)
#  nombres          :string(255)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include Validations
  include Tokenizable
  include GravatarImagen

# relationships
  has_many :cierres_caja

end
