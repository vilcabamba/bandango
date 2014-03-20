require "bandango_pusher"

namespace :pusher do
  desc "open a socket to pusher and bind to events"
  task connect: :environment do
    BandangoPusher.instance.initialize!
  end
end
