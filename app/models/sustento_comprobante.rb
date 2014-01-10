# == Schema Information
#
# Table name: sustento_comprobantes
#
#  id                       :integer          not null, primary key
#  codigo                   :integer          not null
#  tipo                     :string(255)      not null
#  codigo_tipo_comprobantes :text
#  created_at               :datetime
#  updated_at               :datetime
#

class SustentoComprobante < ActiveRecord::Base

# serializations
  serialize :codigo_tipo_comprobantes, Array

end
