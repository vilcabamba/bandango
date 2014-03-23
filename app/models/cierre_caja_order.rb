# == Schema Information
#
# Table name: cierre_caja_orders
#
#  id             :integer          not null, primary key
#  cierre_caja_id :integer          not null
#  order_id       :integer          not null
#  order_type     :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#

class CierreCajaOrder < ActiveRecord::Base
# relationships
  belongs_to :cierre_caja
  belongs_to :order, polymorphic: true

# class methods
  def self.last_order_id_for(type)
    where(order_type: type).maximum(:order_id).to_i
  end
end
