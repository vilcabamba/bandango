class Venta < ActiveRecord::Base
  module Sellable
    extend ActiveSupport::Concern

    included do
      before_create :set_comprobante_info
    end

    def set_comprobante_info
      emisor = Emisor.cached_emisor
      self.fecha_emision = Time.now.to_date
      self.fecha_registro = Time.now.to_date
      self.autorizacion_comprobante = emisor.autorizacion_comprobantes
      self.numero_serie_establecimiento = emisor.codigo_establecimiento
      self.numero_serie_punto_emision = emisor.codigo_punto_emision
      self.numero_serie_comprobante = emisor.next_numero_serie_comprobante
    end
  end
end
