module Api
  class ComprasController < ApiController

    before_action :require_login
    respond_to :json

    def index
      @compras = Compra.includes(:cliente, :comprobante, :retenciones, :order_items => [:item]).page(params[:page])
      render json: @compras, meta: { total_pages: @compras.total_pages, page: @compras.current_page }
    end

    def show
      respond_with Compra.includes(:order_items => [:item]).cached_find(params[:id])
    end

    def create
      respond_with :api, Compra.create(compra_params)
    end

    def update
      respond_with Compra.update(params[:id], compra_params)
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
                                     order_items_params: [:cantidad, :item_id]
    end
  end
end
