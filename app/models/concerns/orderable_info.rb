module OrderableInfo
  extend ActiveSupport::Concern

  included do
    scope :at, ->(date) { where fecha_emision: date }
    scope :today, -> { at Date.today }
    scope :yesterday, -> { at Date.yesterday }
  end

  def total_price
    @total_price ||= order_items.inject(0) do |prev, order_item|
      prev + order_item.total_price
    end.round(2)
  end

  module ClassMethods
    def total
      all.map(&:total_price).reduce(:+).to_f.round 2
    end
  end
end
