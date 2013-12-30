module Api
  class ClientesController < ApiController

    before_action :require_login
    respond_to :json

    def index
      if params[:identificacion]
        respond_with Cliente.cached_search_for_identificacion(params[:identificacion])
      else
        @clientes = Cliente.page(params[:page]).per(10)
        render json: @clientes, meta: {total_pages: @clientes.total_pages, page: @clientes.current_page}
      end
    end

    def show
      respond_with Cliente.find(params[:id])
    end

    def create
      respond_with :api, Cliente.create(cliente_params)
    end

    def update
      respond_with Cliente.update(params[:id], cliente_params)
    end

    def destroy
      respond_with Cliente.destroy(params[:id])
    end

    private

    def cliente_params
      params.require(:cliente).permit :tipo_id, :identificacion, :nombres, :direccion, :telefono, :email
    end
  end
end
