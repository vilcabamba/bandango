# == Schema Information
#
# Table name: order_items
#
#  id                 :integer          not null, primary key
#  item_id            :integer          not null
#  order_id           :integer          not null
#  cantidad           :integer          not null
#  cached_item_precio :float            not null
#  cached_item_nombre :string(255)      not null
#  created_at         :datetime
#  updated_at         :datetime
#

class OrderItem < ActiveRecord::Base
  include Validations

end
