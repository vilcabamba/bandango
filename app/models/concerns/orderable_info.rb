module OrderableInfo
  extend ActiveSupport::Concern

  included do
    scope :at, ->(date) { where fecha_emision: date }
    scope :today, -> { at Date.today }
    scope :yesterday, -> { at Date.yesterday }
  end

  def load!
    unless @loaded
      @loaded = true
      @total_iva = 0
      @total_ice = 0
      @total_price = 0
      order_items.each do |order_item|
        @total_iva += order_item.iva_twelve.round(2)
        @total_ice += order_item.ice_total.round(2)
        @total_price += order_item.total_price.round(2)
      end
    end
  end

  def total_price
    load!
    @total_price
  end

  def total_iva
    load!
    @total_iva
  end

  def total_ice
    load!
    @total_ice
  end

  module ClassMethods
    def total
      all.map(&:total_price).reduce(:+).to_f.round 2
    end

    def formas_de_pago
      all.uniq.pluck(:forma_de_pago)
    end
  end
end
