base_conf = { url: "redis://localhost:6379", namespace: "#{Rails.application.class.parent_name}_#{Rails.env}" }

Sidekiq.configure_server do |config|
  config.redis = base_conf
end

Sidekiq.configure_client do |config|
  config.redis = base_conf.merge(size: 1)
end

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    Sidekiq.configure_client do |config|
      config.redis = base_conf.merge(size: 1)
    end if forked
  end
end
