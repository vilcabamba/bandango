# == Schema Information
#
# Table name: emisores
#
#  id                                       :integer          not null, primary key
#  ruc                                      :string(255)      not null
#  razon_social                             :string(255)      not null
#  nombre_comercial                         :string(255)
#  direccion_matriz                         :string(255)      not null
#  direccion_establecimiento                :string(255)      not null
#  codigo_establecimiento                   :string(255)      not null
#  codigo_punto_emision                     :string(255)      not null
#  contribuyente_especial_numero_resolucion :string(255)
#  obligado_a_llevar_contabilidad           :boolean
#  logo                                     :string(255)
#  created_at                               :datetime
#  updated_at                               :datetime
#

class Emisor < ActiveRecord::Base
  include Validations

end
