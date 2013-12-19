module Api
  class ClientesController < ApiController

    def index
      render json: Cliente.all
    end

  end
end
