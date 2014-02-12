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
      respond_with :api, Compra.create_with_order_items(compra_params, order_items_compra_params)
    end

    def update
      respond_with Compra.update_with_order_items(params[:id], compra_params, order_items_compra_params)
    end

    private

    def compra_params
      params.require(:compra).permit :cliente_id,
                                     :comprobante_id,
                                     :sustento_comprobante_id
    end
    def order_items_compra_params
      params.require(:compra).permit :order_items => [:cantidad, :item_id]
    end

  end
end
