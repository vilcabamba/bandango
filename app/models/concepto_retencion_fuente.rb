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

# table name
  self.table_name = :conceptos_retencion_fuente

# relationships
  has_many :retenciones

end
