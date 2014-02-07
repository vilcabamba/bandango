ActionMailer::Base.smtp_settings = YAML::load_file(File.join(Rails.root.to_s, "config", "email.yml")).symbolize_keys
