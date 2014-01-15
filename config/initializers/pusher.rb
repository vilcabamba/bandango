key = YAML::load_file(File.join(Rails.root.to_s, "config", "pusher.yml"))["key"]

PusherClient.logger = Rails.logger

socket = PusherClient::Socket.new(key)
socket.connect(true) # Connect asynchronously

# Subscribe to business chanel
socket.subscribe(SANI[:business_token])

# Bind to a global event
socket.bind('new_transaccion') do |data|
  SaniGetWorker.schedule
end
