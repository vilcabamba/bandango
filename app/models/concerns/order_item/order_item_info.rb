class OrderItem < ActiveRecord::Base
  module OrderItemInfo
    extend ActiveSupport::Concern

    included do
      before_validation :set_item_attributes
    end

    def set_item_attributes
      if item
        self.cached_item_precio = item.base
        self.cached_item_nombre = item.nombre
      end
    end
  end
end
