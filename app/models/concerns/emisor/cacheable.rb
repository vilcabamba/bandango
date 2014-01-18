class Emisor < ActiveRecord::Base
  module Cacheable
    extend ActiveSupport::Concern

    included do
      after_commit :flush_emisor_cache
    end

    def flush_emisor_cache
      Rails.cache.delete [self.class.name, "emisor"]
    end

    module ClassMethods
      def cached_emisor
        Rails.cache.fetch [name, "emisor"] do
          emisor
        end
      end
    end
  end
end
