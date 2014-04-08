class Item < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :category_id, presence: true
      validates :nombre,      presence: true
      validates :base_venta,  numericality: { greater_than: 0 },
                              allow_blank: true
      validates :base_compra, numericality: { greater_than: 0 },
                              allow_blank: true
      validates :iva_tarifa,  numericality: { greater_than: 0 },
                              if: :iva
      validates :ice_tarifa,  numericality: { greater_than: 0 },
                              if: :ice
      validate :validate_nombre_is_unique_on_category
    end

    def validate_nombre_is_unique_on_category
      errors.add(:nombre, "Ya existe un ítem con ese nombre") if category.items.where.not(id: id).exists?(nombre: nombre)
    end
  end
end
