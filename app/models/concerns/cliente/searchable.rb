class Cliente < ActiveRecord::Base
  module Searchable
    extend ActiveSupport::Concern

    module ClassMethods
      def search(query)
        where("identificacion LIKE :query OR nombres LIKE :query OR email LIKE :query", query: "%#{query}%")
      end
    end
  end
end
