# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  nombre     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  include Validations

# relationships
  has_many :items, dependent: :destroy

# scopes
  scope :sorted, -> { order(:nombre) }

end
