class OrderItem < ActiveRecord::Base
  module OrderItemInfo
    extend ActiveSupport::Concern

    included do
      attr_accessor :tipo
      before_validation :set_item_attributes
    end

    def set_item_attributes
      if item
        self.cached_item_nombre = item.nombre
        if tipo == Venta
          self.cached_item_precio = item.base_venta
        end
      end
    end
  end
end
