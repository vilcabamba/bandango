class OrderItem < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :item_id,            presence: true
      validates :order_id,           presence: true
      validates :cantidad,           presence: true,
                                     numericality: { greater_than: 0 }
      validates :cached_item_precio, presence: true,
                                     numericality: { greater_than: 0 }
      validates :cached_item_nombre, presence: true
    end
  end
end
