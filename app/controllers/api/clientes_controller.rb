module Api
  class ClientesController < ApiController

    respond_to :json

    def index
      respond_with Cliente.all
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
