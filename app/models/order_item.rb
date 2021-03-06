# == Schema Information
#
# Table name: order_items
#
#  id                     :integer          not null, primary key
#  item_id                :integer          not null
#  order_id               :integer          not null
#  cantidad               :integer          not null
#  cached_item_precio     :float            not null
#  cached_item_nombre     :string(255)      not null
#  created_at             :datetime
#  updated_at             :datetime
#  order_type             :string(255)      not null
#  cached_item_iva        :boolean
#  cached_item_ice        :boolean
#  cached_item_iva_tarifa :integer
#  cached_item_ice_tarifa :integer
#

class OrderItem < ActiveRecord::Base
  include Validations
  include OrderItemInfo

# relationships
  belongs_to :item
  belongs_to :order, polymorphic: true

end
