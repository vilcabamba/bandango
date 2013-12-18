email_config = YAML::load_file File.join(Rails.root.to_s, "config", "email.yml")
ActionMailer::Base.smtp_settings = {
  :address              => email_config[:address],
  :port                 => email_config[:port],
  :domain               => email_config[:domain],
  :user_name            => email_config[:user_name],
  :password             => email_config[:password],
  :authentication       => email_config[:authentication],
  :enable_starttls_auto => true
}
