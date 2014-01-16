# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer          default(1), not null
#  nombre      :string(255)      not null
#  descripcion :string(255)
#  base_venta  :float
#  created_at  :datetime
#  updated_at  :datetime
#  iva         :boolean          default(TRUE)
#  iva_tarifa  :integer          default(12)
#  ice         :boolean          default(FALSE)
#  ice_tarifa  :integer
#  se_vende    :boolean
#  se_compra   :boolean
#  base_compra :float
#

class Item < ActiveRecord::Base
  include Searchable
  include Validations

# scopes
  scope :category, ->(category_id) { where(category_id: category_id) }
  scope :type,     ->(type) {
    if type == "venta"
      where(se_vende: true)
    else
      where(se_compra: true)
    end
  }

# relationships
  belongs_to :category
  has_many :order_item
  has_many :ventas, through: :order_item
  
end
