# == Schema Information
#
# Table name: concepto_retencion_fuentes
#
#  id         :integer          not null, primary key
#  codigo     :string(255)      not null
#  concepto   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class ConceptoRetencionFuente < ActiveRecord::Base
end
