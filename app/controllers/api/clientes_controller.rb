module Api
  class ClientesController < ApiController
    before_action :require_login

    respond_to :json

    def index
      if params[:identificacion].present?
        search_by_identificacion
      elsif params[:search].present?
        search
      else
        list
      end
    end

    def search_by_identificacion
      respond_with Cliente.cached_search_for_identificacion(params[:identificacion])
    end

    def search
      render json: Cliente.sorted.search(params[:search]).limit(10),
             meta: { query: params[:search] }
    end

    def list
      clientes = Cliente.sorted.page(params[:page])
      render json: clientes,
             meta: { total_pages: clientes.total_pages,
                            page: clientes.current_page }
    end

    def show
      respond_with Cliente.cached_find(params[:id])
    end

    def create
      respond_with :api, Cliente.create(cliente_params)
    end

    def update
      respond_with Cliente.update(params[:id], cliente_params)
    end

    def destroy
      cliente = Cliente.cached_find(params[:id])
      if cliente.can_destroy?
        respond_with cliente.destroy
      else
        render json: { cliente: "", errors: { base: cliente.why_cant_destroy } }, status: 422
      end
    end

    private

    def cliente_params
      params.require(:cliente).permit :tipo_id, :identificacion, :nombres, :direccion, :telefono, :email
    end
  end
end
