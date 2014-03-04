class SaniRequest < ActiveRecord::Base
  module Parseable
    extend ActiveSupport::Concern

    module ClassMethods
      def parse_transacciones(transacciones)
        transacciones.each do |transaccion|
          parse_transaccion transaccion
        end
      end
      def parse_transaccion(transaccion)
        klass = Object.const_get transaccion["model"].camelize
        attrs = JSON.parse transaccion["attrs"]
        identificator = transaccion["identificator"]
        case transaccion["action"]
        when "destroy"
          record = klass.find_by(identificator => attrs[identificator])
          if record
            record.dont_sync = true
            record.destroy
          end
        else  # create - update
          klass.where(identificator => attrs[identificator]).first_or_initialize.tap do |object|
            object.dont_sync = true
            object.update! attrs
          end
        end
      end
    end
  end
end
