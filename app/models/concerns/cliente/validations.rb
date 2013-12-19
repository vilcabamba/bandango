class Cliente < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :tipo_id, presence: true
      validates :identificacion, presence: true,
                               uniqueness: true
      validates :nombres, presence: true
      validates :email, uniqueness: true
    end
  end
end