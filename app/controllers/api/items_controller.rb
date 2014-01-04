module Api
  class ItemsController < ApiController

    before_action :require_login
    respond_to :json

    def index
      if params[:query]     # respond to jQuery autocomplete
        @items = Item.search_by_nombre params[:query]
        render json: @items, each_serializer: ItemAutocompleteSerializer
      else
        @items = Item.page(params[:page])
        render json: @items,
               meta: { total_pages: @items.total_pages,
                              page: @items.current_page }
      end
    end

  end
end
