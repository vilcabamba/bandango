module Api
  class CashDenominationsController < ApiController
    before_action :require_login

    respond_to :json

    caches_action :index, cache_path: proc {
      CashDenomination.index_cache_view_key
    }

    def index
      respond_with CashDenomination.all
    end
  end
end
