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

  def order_items_params=(order_items_params)
    order_items.destroy_all
    self.order_items = Array(order_items_params).map do |order_item|
      OrderItem.new order_item.merge(tipo: self)
    end
  end
end
