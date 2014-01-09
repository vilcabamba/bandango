class Item < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :category_id, presence: true
      validates :nombre,      presence: true
      validates :base,        presence: true,
                              numericality: { greater_than: 0 }
      validates :iva_tarifa,  numericality: { greater_than: 0 },
                              if: :iva
      validates :ice_tarifa,  numericality: { greater_than: 0 },
                              if: :ice
    end
  end
end
