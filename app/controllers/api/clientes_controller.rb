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

    def show
      respond_with Cliente.cached_find(params[:id])
    end

    def create
      cliente = Cliente.new(cliente_params)
      track!(cliente) if cliente.save
      respond_with :api, cliente
    end

    def update
      cliente = Cliente.find(params[:id])
      track!(cliente) if cliente.update(cliente_params)
      respond_with cliente
    end

    def destroy
      cliente = Cliente.cached_find(params[:id])
      if cliente.can_destroy?
        track!(cliente, params: nil)
        respond_with cliente.destroy
      else
        render json: { cliente: "", errors: { base: cliente.why_cant_destroy } }, status: 422
      end
    end

    private

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

    def cliente_params
      params.require(:cliente).permit :tipo_id, :identificacion, :nombres, :direccion, :telefono, :email
    end
  end
end
