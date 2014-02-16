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
        self.cached_item_precio = if tipo == Venta then item.base_venta else item.base_compra end
      end
    end
  end
end
