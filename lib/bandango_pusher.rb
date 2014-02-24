class BandangoPusher
  include Singleton

  def initialize
    @pusher_key = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))["key"]
    PusherClient.logger = Rails.logger
    schedule_sani_workers
  end

  def schedule_sani_workers
    SaniGetWorker.schedule if Sidekiq.server?
  end

  def initialize!
    socket = PusherClient::Socket.new(@pusher_key)
    socket.connect(true) # Connect asynchronously

    # Subscribe to business chanel
    socket.subscribe(SANI[:business_token])

    # Bind to a global event
    socket.bind("new_transaccion") do |data|
      SaniGetWorker.schedule
    end
  end
end
