# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer          default(1), not null
#  nombre      :string(255)      not null
#  descripcion :string(255)
#  precio      :float            not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  include Searchable
  include Validations

# relationships
  belongs_to :category
  has_many :order_item
  has_many :ventas, through: :order_item
  
end
