class Venta < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :cliente_id,     presence: true
      validates :comprobante_id, presence: true
      validates :base_no_iva,    presence: true,
                                 numericality: { greater_than: 0 }
      validates :base_iva_zero,  presence: true,
                                 numericality: { greater_than: 0 }
      validates :base_iva,       presence: true,
                                 numericality: { greater_than: 0 }
      validates :monto_iva,      presence: true,
                                 numericality: { greater_than: 0 }
      validates :iva_retenido,   presence: true,
                                 numericality: { greater_than: 0 }
    end
  end
end
