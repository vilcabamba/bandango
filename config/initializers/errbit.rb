Airbrake.configure do |config|
  config.api_key     = "4ed831a9c49fedf639b3d68d90cd283b"
  config.host        = "pangi.shiriculapo.com"
  config.port        = 80
  config.secure      = config.port == 443
  config.async       = true
end
