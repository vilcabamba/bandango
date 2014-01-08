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

    def show
      respond_with Category.cached_find(params[:id])
    end

    def create
      respond_with :api, Category.create(category_params)
    end

    private

    def category_params
      params.require(:category).permit :nombre
    end

  end
end
