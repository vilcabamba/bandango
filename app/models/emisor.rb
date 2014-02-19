# encoding: utf-8
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
#  obligado_llevar_contabilidad             :boolean
#  imagen                                   :string(255)
#  created_at                               :datetime
#  updated_at                               :datetime
#  autorizacion_comprobantes                :string(255)
#

class Emisor < ActiveRecord::Base
  include Single
  include Cacheable
  include Validations
  include ImagenUploadable

# uploaders
  mount_uploader :imagen, EmisorImagenUploader

# validate ruc
  validates_id :ruc, message: "RUC inválido",
                        only: [:ruc]

end
