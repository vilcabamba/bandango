class Emisor < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :razon_social,              presence: true
      validates :direccion_matriz,          presence: true
      validates :direccion_establecimiento, presence: true
      validates :codigo_establecimiento,    presence: true
      validates :codigo_punto_emision,      presence: true
      validates :ruc,                       presence: true,
                                          uniqueness: true
    end
  end
end
