class PusherWorker
  include Sidekiq::Worker
  sidekiq_options backtrace: true

  def perform
    key = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))["key"]

    socket = PusherClient::Socket.new(key)
    socket.connect(true) # Connect asynchronously

    # Subscribe to business chanel
    socket.subscribe(SANI[:business_token])

    # Bind to a global event
    socket.bind('new_transaccion') do |data|
      SaniGetWorker.perform_async
    end

    # # Bind to a channel event
    # socket['channel1'].bind('channelevent') do |data|
    #   puts data
    # end

    loop do
      sleep(1) # Keep your main thread running
    end
  end
end
