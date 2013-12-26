module ModelCaching
  extend ActiveSupport::Concern

  included do
    after_commit :flush_cache
  end

  def flush_cache
    Rails.logger.debug "[cache]: flushing cache from #{self.class.name} #{self.id}"
    Rails.cache.delete([self.class.name, id])
  end

  module ClassMethods
    def cached_find(id)
      Rails.cache.fetch([name, id]) do
        Rails.logger.debug "[cache]: caching #{name} #{id}"
        find(id)
      end
    end
  end
end


ActiveRecord::Base.send(:include, ModelCaching)
