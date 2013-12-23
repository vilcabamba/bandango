class User < ActiveRecord::Base
  module Tokenizable
    extend ActiveSupport::Concern

    included do
      before_create :create_token!
    end

    def create_token!
      begin
        self.token = SecureRandom.hex(50)
      end while self.class.exists?(token: token)
    end
  end
end
