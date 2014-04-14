ActionMailer::Base.smtp_settings = {
  address: ENV["SMTP_ADDRESS"] || "smtp.gmail.com",
  port: ENV["SMTP_PORT"] || 587,
  authentication: ENV["SMTP_AUTHENTICATION"] || "plain",
  enable_starttls_auto: true,
  domain: ENV["SMTP_DOMAIN"],
  user_name: ENV["SMTP_USERNAME"],
  password: ENV["SMTP_PASSWORD"]
}
