key = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))["key"]

# set rails logger
PusherClient.logger = Rails.logger

# schedule 1 get
SaniGetWorker.schedule

socket = PusherClient::Socket.new(key)
socket.connect(true) # Connect asynchronously

# Subscribe to business chanel
socket.subscribe(SANI[:business_token])

# Bind to a global event
socket.bind('new_transaccion') do |data|
  SaniGetWorker.schedule
end
