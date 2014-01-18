class Venta < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates_associated :order_items
    end
  end
end
