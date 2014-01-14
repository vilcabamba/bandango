class SaniPostWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform(object, class_name, action)
    url = SANI[:host] + "/api/transacciones.json"
    params = {
      transaccion: {
        action: action,
        class_name: class_name,
        object: object
      }
    }
    RestClient.post url, params.to_json, :content_type => :json, :Authorization => "Token token=\"#{SANI[:token]}\""
  end
end
