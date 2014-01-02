module Api
  class VentasController < ApiController
  
    before_action :require_login
    respond_to :json

    def index
      @ventas = Venta.includes(:cliente, :comprobante).page(params[:page]).per(10)
      render json: @ventas, meta: { total_pages: @ventas.total_pages, page: @ventas.current_page }
    end
    
  end
end
