class User < ActiveRecord::Base
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :username, uniqueness: true,
                             presence: true
      validates :email, uniqueness: true,
                          presence: true
    end
  end
end
