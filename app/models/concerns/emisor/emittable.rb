class Emisor < ActiveRecord::Base
  module Emittable
    def next_numero_serie_comprobante
      max_numero_serie_comprobante.to_i + 1
    end

    def max_numero_serie_comprobante
      Venta.maximum(:numero_serie_comprobante) || 0
    end
  end
end
