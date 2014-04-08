class User < ActiveRecord::Base
  module Caching
    extend ActiveSupport::Concern

    included do
      after_commit :flush_user_cache
    end

    def flush_user_cache
      Rails.cache.delete([self.class.name, :active, id])
    end

    module ClassMethods
      def active_cached_find(id)
        Rails.cache.fetch([name, :active, id]) do
          active.find(id)
        end
      end
    end
  end
end
