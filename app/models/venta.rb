# == Schema Information
#
# Table name: ventas
#
#  id             :integer          not null, primary key
#  cliente_id     :integer          not null
#  comprobante_id :integer          not null
#  renta_retenido :float            not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Venta < ActiveRecord::Base
  include VentaInfo
  include Validations
  self.table_name = :ventas

# relationships
  belongs_to :cliente
  belongs_to :comprobante
  has_many :order_items, foreign_key: :order_id
  has_many :items, through: :order_items

end
