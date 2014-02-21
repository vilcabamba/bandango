class OrderItem < ActiveRecord::Base
  module OrderItemInfo
    extend ActiveSupport::Concern

    included do
      attr_accessor :tipo
      before_validation :cache_item_attributes
    end

    def cache_item_fields
      [:nombre, :iva, :ice, :iva_tarifa, :ice_tarifa]
    end

    def cache_item_attributes
      if cached_item_precio.blank?
        self.cached_item_precio = if order.class == Venta
            item.base_venta
          else
            item.base_compra
          end
      end
      cache_item_fields.each do |field|
        if send("cached_item_#{field.to_s}").blank?
          send "cached_item_#{field.to_s}=", item.send(field)
        end
      end
    end
  end
end
