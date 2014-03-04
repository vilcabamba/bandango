# taken New Relic's rpm as example:
# https://github.com/newrelic/rpm/blob/master/lib/new_relic/local_environment.rb
class LocalEnvironment
  include Singleton

  attr_reader :dispatcher

  def initialize
    find_dispatcher
  end

  def find_dispatcher
    %w[passenger sidekiq webrick].each do |dispatcher|
      send "detect_#{dispatcher}"
    end
  end

  private

  def detect_passenger
    @dispatcher = :passenger if defined?(::PhusionPassenger)
  end

  def detect_sidekiq
    @dispatcher = :sidekiq if defined?(::Sidekiq) && File.basename($0) == "sidekiq"
  end

  def detect_webrick
    @dispatcher = :webrick if defined?(::WEBrick) && defined?(::WEBrick::VERSION)
  end
end
