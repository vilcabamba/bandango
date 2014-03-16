# == Schema Information
#
# Table name: ventas
#
#  id                           :integer          not null, primary key
#  cliente_id                   :integer          not null
#  comprobante_id               :integer          not null
#  created_at                   :datetime
#  updated_at                   :datetime
#  numero_serie_establecimiento :string(255)
#  numero_serie_punto_emision   :string(255)
#  numero_serie_comprobante     :string(255)
#  fecha_emision                :date
#  fecha_registro               :date
#  autorizacion_comprobante     :string(255)
#  forma_de_pago                :string(255)      default("Efectivo"), not null
#

class Venta < ActiveRecord::Base
  include Sellable
  include Orderable
  include Validations
  include OrderableInfo

# default scope
  default_scope { order("id DESC") }

# relationships
  belongs_to :cliente
  belongs_to :comprobante
  has_many :order_items, as: :order, dependent: :destroy
  has_many :items, through: :order_items
  has_many :retenciones, as: :order

end
