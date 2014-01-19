# encoding: utf-8
module OrderableValidations
  extend ActiveSupport::Concern

  included do
    validates :cliente_id,     presence: true
    validates :comprobante_id, presence: true
    validate :has_order_items
  end

  def has_order_items
    errors.add(:order_items, "Agrega al menos un ítem") unless order_items.length > 0
  end
end
