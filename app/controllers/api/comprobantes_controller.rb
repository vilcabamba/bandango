module Api
  class ComprobantesController < ApiController
    before_action :require_login
    respond_to :json

    caches_action :index, cache_path: proc {
      Comprobante.index_cache_view_key
    }

    def index
      respond_with Comprobante.all
    end
  end
end
