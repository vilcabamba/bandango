module Api
  class ComprasController < OrderableController
    respond_to :json

    def index
      @compras = Compra.includes(:cliente, :comprobante, :sustento_comprobante, retenciones: [:concepto_retencion_fuente], order_items: [:item]).page(params[:page])
      render json: @compras, meta: { total_pages: @compras.total_pages, page: @compras.current_page }
    end

    def show
      respond_with Compra.includes(:cliente, :comprobante, :sustento_comprobante, retenciones: [:concepto_retencion_fuente], order_items: [:item]).cached_find(params[:id])
    end

    def create
      respond_with :api, Compra.create(compra_params)
    end

    def update
      compra = Compra.update(params[:id], compra_params)
      render json: compra
    end

    private

    def compra_params
      params.require(:compra).permit :cliente_id,
                                     :comprobante_id,
                                     :sustento_comprobante_id,
                                     :autorizacion_comprobante,
                                     :fecha_emision,
                                     :fecha_registro,
                                     :numero_serie_comprobante,
                                     :numero_serie_establecimiento,
                                     :numero_serie_punto_emision,
                                     :forma_de_pago,
                                     order_items_params: order_items_params,
                                     retenciones_params: retenciones_params
    end
  end
end
