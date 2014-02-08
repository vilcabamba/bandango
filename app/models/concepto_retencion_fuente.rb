# == Schema Information
#
# Table name: conceptos_retencion_fuente
#
#  id         :integer          not null, primary key
#  codigo     :string(255)      not null
#  concepto   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  porcentaje :float
#

class ConceptoRetencionFuente < ActiveRecord::Base
  include Caching

# relationships
  has_many :compras

end
