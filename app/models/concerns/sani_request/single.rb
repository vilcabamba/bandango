class SaniRequest < ActiveRecord::Base
  module Single
    extend ActiveSupport::Concern

    module ClassMethods
      def last_id
        if sani_request = first
          sani_request.last_id
        else
          0
        end
      end
      def last_id=(id)
        first_or_initialize.update! last_id: id
      end  
    end
  end
end
