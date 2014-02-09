# == Schema Information
#
# Table name: retenciones
#
#  id                           :integer          not null, primary key
#  order_id                     :integer          not null
#  concepto_retencion_fuente_id :integer
#  fecha_emision                :date             default(Mon, 20 Jan 2014), not null
#  numero_retencion             :string(255)      not null
#  iva                          :boolean
#  tarifa_iva                   :integer
#  ice                          :boolean
#  tarifa_ice                   :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#

class Retencion < ActiveRecord::Base
  include Validations

# relationships
  belongs_to :compra
  belongs_to :venta

end
