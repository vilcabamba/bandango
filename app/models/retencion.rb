# == Schema Information
#
# Table name: retenciones
#
#  id                           :integer          not null, primary key
#  order_id                     :integer          not null
#  concepto_retencion_fuente_id :integer
#  fecha_emision                :date             not null
#  created_at                   :datetime
#  updated_at                   :datetime
#  numero_autorizacion          :string(255)
#  numero_serie_establecimiento :string(255)
#  numero_serie_punto_emision   :string(255)
#  numero_serie_secuencial      :string(255)
#  order_type                   :string(255)      not null
#

class Retencion < ActiveRecord::Base
  include Validations

# relationships
  belongs_to :order, polymorphic: true
  belongs_to :concepto_retencion_fuente

end
