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

    def taxes
      iva_twelve + ice_total
    end

    def iva_twelve
      @iva_twelve ||= begin
        return 0 unless cached_item_iva
        iva = price * (cached_item_iva_tarifa / 100.0)
        iva.round(2)
      end
    end

    def ice_total
      @ice_total ||= begin
        return 0 unless cached_item_ice
        ice = price * (cached_item_ice_tarifa / 100.0)
        ice.round(2)
      end
    end

    def price
      @price ||= cantidad * cached_item_precio
    end

    def total_price
      @total_price ||= price + taxes
    end
  end
end
