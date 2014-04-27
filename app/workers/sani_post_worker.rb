class SaniPostWorker < SaniWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform(object, class_name, action, time)
    params = {
      transaccion: {
        action: action,
        class_name: class_name,
        object: object,
        time: time
      }
    }
    sani_request do
      RestClient.post transacciones_url, params.to_json, restclient_options
    end
  end
end
