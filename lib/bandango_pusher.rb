class BandangoPusher
  include Singleton

  attr_reader :minutes_to_reconnect

  def initialize
    @minutes_to_reconnect = 1
    load_pusher_credentials
    set_pusher_logger
    schedule_sani_workers
  end

  def load_pusher_credentials
    yaml = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))
    @key = yaml["key"]
    @secret = yaml["secret"]
  end

  def schedule_sani_workers
    SaniGetWorker.schedule
  end

  def initialize!
    @socket = PusherClient::Socket.new(@key, secret: @secret)

    # Subscribe to business chanel
    @socket.subscribe(SANI[:business_token])

    # Bind to a global event
    @socket.bind("new_transaccion") do |data|
      Rails.logger.debug "new_transaction"
      SaniGetWorker.schedule
    end

    connect!
  end

  def connect!
    @socket.connect
  rescue SocketError => e
    @minutes_to_reconnect *= 4
    Rails.logger.info "Can't connect to pusher. Probably the internet connection is down. Will try again in #{minutes_to_reconnect}"
    Rails.logger.debug "#{e} minutes"
    sleep 60 * minutes_to_reconnect
    connect!
  end

  def set_pusher_logger
    PusherClient.logger = Rails.logger
    PusherClient.logger.level = Logger::ERROR if Rails.env.production?
  end
end
