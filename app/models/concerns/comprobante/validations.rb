class Comprobante < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :codigo, presence: true
      validates :tipo,   presence: true
    end
  end
end
