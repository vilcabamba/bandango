class Item < ActiveRecord::Base
  module Searchable
    extend ActiveSupport::Concern

    module ClassMethods
      def search_by_nombre(nombre, limit=10)
        where("nombre LIKE :q", q: "%#{nombre}%").limit(limit)
      end
    end
  end
end
