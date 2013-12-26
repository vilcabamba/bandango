class ApplicationController < ActionController::Base
  include Sessions
  include ErrorHandling
  protect_from_forgery with: :exception

end
