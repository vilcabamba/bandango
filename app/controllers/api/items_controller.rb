module Api
  class ItemsController < ApiController

    before_action :require_login
    respond_to :json

    def index
      if params[:query]     # respond to jQuery autocomplete
        @items = Item.search_by_nombre params[:query]
        render json: @items
      else
        @items = Item.category(params[:category_id]).page(params[:page])
        render json: @items,
               meta: { total_pages: @items.total_pages,
                              page: @items.current_page }
      end
    end

    def show
      respond_with Item.cached_find(params[:id])
    end

    def create
      respond_with :api, Item.create(item_params)
    end

    def update
      respond_with Item.update(params[:id], item_params)
    end

    private

    def item_params
      params.require(:item).permit :nombre,
                                   :descripcion,
                                   :se_vende,
                                   :base_venta,
                                   :se_compra,
                                   :base_compra,
                                   :iva,
                                   :iva_tarifa,
                                   :ice,
                                   :ice_tarifa,
                                   :category_id
    end

  end
end
