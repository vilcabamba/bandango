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
#  active           :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include Caching
  include Validations
  include Tokenizable
  include GravatarImagen

# relationships
  has_many :cierres_caja

# scopes
  default_scope { order(active: :desc) }
  scope :active, -> { where(active: true) }

# methods
  def deactivate!
    update! active: false
  end

end
