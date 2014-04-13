module Api
  class VentasController < OrderableController
    respond_to :json

    def index
      @ventas = Venta.recent.eager_loaded.page(params[:page])
      render json: @ventas, meta: { total_pages: @ventas.total_pages, page: @ventas.current_page }
    end

    def show
      respond_with Venta.eager_loading.cached_find(params[:id])
    end

    def create
      respond_with :api, Venta.create(venta_params)
    end

    def update
      venta = Venta.update(params[:id], venta_params)
      render json: venta
    end

    private

    def venta_params
      params.require(:venta).permit :cliente_id,
                                    :comprobante_id,
                                    :forma_de_pago,
                                    order_items_params: order_items_params,
                                    retenciones_params: retenciones_params
    end
  end
end
