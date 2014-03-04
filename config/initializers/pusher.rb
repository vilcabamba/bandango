require "local_environment"
require "bandango_pusher"

BandangoPusher.instance.initialize! unless LocalEnvironment.instance.dispatcher == :sidekiq
