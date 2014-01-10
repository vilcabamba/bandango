class Compra < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :sustento_comprobante_id,      presence: true
      validates :fecha_registro,               presence: true
      validates :numero_serie_establecimiento, presence: true
      validates :numero_serie_punto_emision,   presence: true
      validates :numero_serie_comprobante,     presence: true
      validates :fecha_emision,                presence: true
      validates :autorizacion_comprobante,     presence: true
      validates :retencion_iva_bienes,         presence: true
      validates :retencion_iva_servicios,      presence: true
      validates :retencion_iva_cien,           presence: true
    end
  end
end
