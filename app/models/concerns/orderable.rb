module Orderable
  extend ActiveSupport::Concern

  included do
  # validations
    validates :cliente_id,     presence: true
    validates :comprobante_id, presence: true
    validate  :has_order_items

  # scopes
    scope :recent, -> { order(fecha_emision: :desc) }
    scope :pago, ->(forma_de_pago) { where(forma_de_pago: forma_de_pago) }
    scope :efectivo, -> { pago("Efectivo") }
  end

  def has_order_items
    errors.add(:order_items, "Agrega al menos un ítem") unless order_items.length > 0
  end

  def order_items_params=(order_items_params)
    order_items.destroy_all
    self.order_items = Array(order_items_params).map do |order_item|
      OrderItem.new order_item.merge(order: self)
    end
  end

  def retenciones_params=(retenciones_params)
    retenciones.destroy_all
    self.retenciones = Array(retenciones_params).map do |retencion|
      Retencion.new retencion
    end
  end
end
