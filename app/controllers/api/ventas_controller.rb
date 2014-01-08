module Api
  class VentasController < ApiController
  
    before_action :require_login
    respond_to :json

    def index
      @ventas = Venta.includes(:cliente, :comprobante).page(params[:page])
      render json: @ventas, meta: { total_pages: @ventas.total_pages, page: @ventas.current_page }
    end

    def show
      respond_with Venta.cached_find(params[:id])
    end

    def create
      respond_with :api, Venta.create_with_order_items(venta_params)
    end

    private

    def venta_params
      params.require(:venta).permit :cliente_id,
                                    :comprobante_id,
                                    :order_items => [
                                      :cantidad,
                                      :item_id
                                    ]
    end
    
  end
end
