module Api
  class ItemsController < ApiController
    before_action :require_login

    respond_to :json

    def index
      params[:query] ? search : list
    end

    def search
      # respond to jQuery autocomplete
      @items = Item.sorted.type(params[:type]).search_by_nombre params[:query]
      render json: @items
    end

    def list
      @items = Item.sorted.category(params[:category_id]).page(params[:page])
      render json: @items,
             meta: { total_pages: @items.total_pages,
                            page: @items.current_page }
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
