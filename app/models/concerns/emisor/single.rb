class Emisor < ActiveRecord::Base
  module Single
    extend ActiveSupport::Concern

    module ClassMethods
      def emisor
        first_or_initialize.tap do |emisor|
          if emisor.id.blank?
            emisor.id = 1
          end
        end
      end
      def id
        first.id if first
      end
    end
  end
end
