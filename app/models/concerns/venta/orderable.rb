class Venta < ActiveRecord::Base
  module Orderable
    extend ActiveSupport::Concern

    module ClassMethods
      def create_with_order_items(params, order_items_params)
        params[:order_items] = order_items_params[:order_items].map do |order_item|
          OrderItem.new(order_item)
        end
        create params
      end
      end
    end
  end
end
