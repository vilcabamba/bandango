module Orderable
  extend ActiveSupport::Concern

  included do
    validates :cliente_id,     presence: true
    validates :comprobante_id, presence: true
    validate  :has_order_items
  end

  def has_order_items
    errors.add(:order_items, "Agrega al menos un ítem") unless order_items.length > 0
  end

  module ClassMethods
    def create_with_order_items(params, order_items_params)
      params[:order_items] = Array(order_items_params[:order_items]).map do |order_item|
        OrderItem.new order_item.merge(tipo: self)
      end
      create params
    end

    def update_with_order_items(id, params, order_items_params)
      update(id, params).tap do |venta|
        items_ids = order_items_params[:order_items].map do |order_item|
          order_item[:item_id].tap do |item_id|
            venta.order_items.where(item_id: item_id).first_or_initialize.tap do |new_order_item|
              new_order_item.update_attributes! order_item
            end
          end
        end
        venta.order_items.where.not(item_id: items_ids).destroy_all
      end
    end
  end
end
