class Cliente < ActiveRecord::Base
  module IdValidations
    extend ActiveSupport::Concern

    included do
      validate :validate_id_if_necessary
    end

    def id_validator
      if not @id_validator or @id_validator.id != identificacion
        @id_validator = IdEcuador.new(identificacion)
      end
      @id_validator
    end

    def validate_id_if_necessary
      unless identificacion.blank?
        if tipo_id == "Cédula"
          errors.add(:identificacion, "No es una cédula válida") unless id_validator.valid? and id_validator.tipo_id_sym == :cedula
        elsif tipo_id == "RUC"
          errors.add(:identificacion, "No es un RUC válido") unless id_validator.valid? and id_validator.tipo_id_sym == :ruc
        end
      end
    end
  end
end
