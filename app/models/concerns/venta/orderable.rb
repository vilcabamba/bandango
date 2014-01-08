class Venta < ActiveRecord::Base
  module Orderable
    extend ActiveSupport::Concern

    module ClassMethods
      def create_with_order_items(params)
        order_items = params[:order_items].map do |order_item|
          OrderItem.new(order_item)
        end
        create cliente_id: params[:cliente_id],
           comprobante_id: params[:comprobante_id],
              order_items: order_items
      end
    end
  end
end
