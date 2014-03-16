module Api
  class StatsController < ApiController
    before_action :require_login

    respond_to :json

    def index
      stats = {
        stats: [Stats.for(:today), Stats.for(:yesterday)],
        chart: Stats.chart
      }
      render json: stats
    end
  end
end
