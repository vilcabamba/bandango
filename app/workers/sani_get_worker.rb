class SaniGetWorker < SaniWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform
    url = "#{transacciones_url}?since=#{SaniRequest.last_id}"
    sani_request do
      response = RestClient.get(url, restclient_options)
      response = JSON.parse(response)
      SaniRequest.parse_transacciones response["transacciones"]
      SaniRequest.last_id = response["meta"]["max_id"]
    end
  end
  def self.schedule
    perform_async unless Sidekiq::Queue.new.map(&:klass).include?("SaniGetWorker")
  end
end
