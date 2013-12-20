module Api
  class ClientesController < ApiController

    respond_to :json

    before_action :find_cliente, only: [:show, :update, :destroy]

    def index
      respond_with Cliente.all
    end

    def show
      respond_with @cliente
    end

    def create
      respond_with :api, Cliente.create(cliente_params)
    end

    def update
      respond_with :api, @cliente.update_attributes(cliente_params)
    end

    def destroy
      respond_with :api, @cliente.destroy
    end

    private

    def cliente_params
      params.require(:cliente).permit :tipo_id, :identificacion, :nombres, :direccion, :telefono, :email
    end
    def find_cliente
      @cliente = Cliente.find(params[:id])
    end
  end
end
