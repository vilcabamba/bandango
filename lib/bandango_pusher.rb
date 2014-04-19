class BandangoPusher
  include Singleton

  attr_reader :minutes_to_reconnect

  def initialize
    @minutes_to_reconnect = 1
    load_pusher_credentials
    set_pusher_logger
  end
  
  def initialize!
    schedule_sani_worker
    
    @socket = PusherClient::Socket.new(@key, secret: @secret)

    # Subscribe to business chanel
    @socket.subscribe(SANI[:business_token])

    # Bind to a global event
    @socket.bind("new_transaccion") do |data|
      schedule_sani_worker
    end

    connect!
  end
  
  private

  def load_pusher_credentials
    @key = ENV["PUSHER_KEY"]
    @secret = ENV["PUSHER_SECRET"]
  end

  def schedule_sani_worker
    SaniGetWorker.schedule
  end

  def connect!
    @socket.connect
  rescue SocketError => e
    @minutes_to_reconnect *= 4
    Rails.logger.info "Can't connect to pusher (#{e}). Probably the internet connection is down. Will try again in #{minutes_to_reconnect}"
    sleep 60 * minutes_to_reconnect
    connect!
  end

  def set_pusher_logger
    PusherClient.logger = Rails.logger
  end
end
