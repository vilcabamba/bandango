class Item < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :category_id, presence: true
      validates :nombre,      presence: true
      validates :base,        presence: true,
                              numericality: { greater_than: 0 }
    end
  end
end
