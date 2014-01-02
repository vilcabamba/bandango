module Api
  class ComprobantesController < ApiController
    before_action :require_login
    respond_to :json

    def index
      respond_with Comprobante.all
    end
  end
end
