module Orderable
  extend ActiveSupport::Concern

  module ClassMethods
    def create_with_order_items(params, order_items_params)
      unless order_items_params.empty?
        params[:order_items] = order_items_params[:order_items].map do |order_item|
          OrderItem.new order_item.merge({tipo: self})
        end
        create params
      end
    end

    def update_with_order_items(id, params, order_items_params)
      update(id, params).tap do |venta|
        items_ids = order_items_params[:order_items].map do |order_item|
          venta.order_items.where(item_id: order_item[:item_id]).first_or_initialize.tap do |new_order_item|
            new_order_item.update_attributes! order_item
          end
          order_item[:item_id]
        end
        venta.order_items.where.not(item_id: items_ids).destroy_all
      end
    end
  end
end
