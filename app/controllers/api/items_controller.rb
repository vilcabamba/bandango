module Api
  class ItemsController < ApiController

    before_action :require_login
    respond_to :json

    def index
      @items = Item.page(params[:page])
      render json: @items,
             meta: { total_pages: @items.total_pages,
                            page: @items.current_page }
    end

  end
end
