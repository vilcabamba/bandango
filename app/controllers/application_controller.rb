class ApplicationController < ActionController::Base
  include ErrorHandling
  protect_from_forgery with: :exception

end
