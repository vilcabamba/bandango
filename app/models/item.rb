# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer          default(1), not null
#  nombre      :string(255)      not null
#  descripcion :string(255)
#  base        :float            not null
#  created_at  :datetime
#  updated_at  :datetime
#  iva         :boolean          default(TRUE)
#  iva_tarifa  :integer          default(12)
#  ice         :boolean          default(FALSE)
#  ice_tarifa  :integer
#

class Item < ActiveRecord::Base
  include Searchable
  include Validations

# relationships
  belongs_to :category
  has_many :order_item
  has_many :ventas, through: :order_item
  
end
