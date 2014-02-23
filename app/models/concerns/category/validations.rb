class Category < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :nombre, presence: true, uniqueness: true
    end
  end
end
