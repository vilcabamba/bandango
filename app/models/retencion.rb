# == Schema Information
#
# Table name: retenciones
#
#  id                           :integer          not null, primary key
#  order_id                     :integer          not null
#  concepto_retencion_fuente_id :integer
#  fecha_emision                :date             default(Mon, 20 Jan 2014), not null
#  iva                          :boolean
#  tarifa_iva                   :integer
#  ice                          :boolean
#  tarifa_ice                   :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#  numero_autorizacion          :string(255)
#  numero_serie_establecimiento :string(255)
#  numero_serie_punto_emision   :string(255)
#  numero_serie_secuencial      :string(255)
#

class Retencion < ActiveRecord::Base
  include Validations

# relationships
  belongs_to :compra
  belongs_to :venta
  belongs_to :concepto_retencion_fuente

end
