class ApplicationController < ActionController::Base
  include Sessions

  protect_from_forgery with: :exception
end
