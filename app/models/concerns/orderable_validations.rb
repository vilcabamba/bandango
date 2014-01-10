module OrderableValidations
  extend ActiveSupport::Concern

  included do
    validates :cliente_id,     presence: true
    validates :comprobante_id, presence: true
  end
end
