module Api
  class CierresCajaController < ApiController
    before_action :require_login

    respond_to :json

    def new
      respond_with CierreCaja.new.prepare!
    end

    def create
      respond_with :api, CierreCaja.create(cierre_caja_params.merge(user_id: current_user.id))
    end

    private

    def cierre_caja_params
      params.require(:cierre_caja).permit :retiro, cash_denomination_items_params: [:cantidad, :cash_denomination_id]
    end
  end
end
