# make sure only one of this workers is running

pusher_socket_open = false
Sidekiq::Workers.new.each do |name, work, started_at|
  pusher_socket_open = true if work["payload"]["class"] == "PusherWorker"
end

unless pusher_socket_open
  PusherWorker.perform_async
end
