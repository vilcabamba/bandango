module Api
  class CategoriesController < ApiController

    before_action :require_login
    respond_to :json

    def index
      @categories = Category.page(params[:page])
      render json: @categories,
             meta: { total_pages: @categories.total_pages,
                            page: @categories.current_page }
    end

  end
end
