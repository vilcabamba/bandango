class SaniGetWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform
    since = 1
    url = SANI[:host] + "/api/transacciones.json?since=#{since}"
    response = JSON.parse(RestClient.get url, :content_type => :json, :Authorization => "Token token=\"#{SANI[:token]}\"")
    response["transacciones"].each do |transaccion|
      puts transaccion["action"]
    end
  end
end
