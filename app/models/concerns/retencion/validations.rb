class Retencion < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :order_id,                     presence: true
      validates :concepto_retencion_fuente_id, presence: true
      validates :fecha_emision,                presence: true
    end
  end
end
