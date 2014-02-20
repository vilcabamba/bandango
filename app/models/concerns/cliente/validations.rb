# encoding: utf-8
class Cliente < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :tipo_id, presence: true
      validates :identificacion, presence: true,
                               uniqueness: true
      # validates :nombres, presence: true
      validates :email, uniqueness: true, allow_blank: true
    end

    def has_compras_or_ventas?
      compras.any? or ventas.any?
    end

    def can_destroy?
      not has_compras_or_ventas?
    end

    def why_cant_destroy
      details = {compra: compras.count, venta: ventas.count}.map do |key, count|
        "#{count} #{key.to_s.pluralize count}" if count > 0
      end.compact
      "No se puede eliminar. Está asociado a #{details.join(" y ")}"
    end
  end
end
