module Api
  class OrderableController < ApiController
    before_action :require_login

    protected

    def order_items_params
      [:cantidad, :item_id]
    end

    def retenciones_params
      [:numero_autorizacion,
       :numero_serie_secuencial,
       :numero_serie_punto_emision,
       :concepto_retencion_fuente_id,
       :numero_serie_establecimiento,
       :fecha_emision]
    end
  end
end
