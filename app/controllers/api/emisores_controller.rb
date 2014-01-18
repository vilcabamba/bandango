module Api
  class EmisoresController < ApiController
    before_action :require_login
    respond_to :json

    def show
      respond_with Emisor.cached_emisor
    end

    def create
      if Emisor.any?
        respond_with Emisor.update(Emisor.id, emisor_params)
      else
        respond_with :api, Emisor.create(emisor_params)
      end
    end
    alias_method :update, :create

    private

    def emisor_params
      params.require(:emisor).permit :ruc,
                                     :razon_social,
                                     :nombre_comercial,
                                     :direccion_matriz,
                                     :direccion_establecimiento,
                                     :codigo_establecimiento,
                                     :codigo_punto_emision,
                                     :contribuyente_especial_numero_resolucion,
                                     :obligado_a_llevar_contabilidad,
                                     :imagen_url
    end
  end
end
