module Api
  class SustentoComprobantesController < ApiController
    before_action :require_login
    respond_to :json

    caches_action :index, cache_path: proc {
      SustentoComprobante.index_cache_view_key
    }

    def index
      respond_with SustentoComprobante.all
    end
  end
end
