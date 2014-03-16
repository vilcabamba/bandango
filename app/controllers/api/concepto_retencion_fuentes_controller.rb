module Api
  class ConceptoRetencionFuentesController < ApiController
    before_action :require_login

    respond_to :json

    caches_action :index, cache_path: proc {
      ConceptoRetencionFuente.index_cache_view_key
    }

    def index
      respond_with ConceptoRetencionFuente.all
    end
  end
end
