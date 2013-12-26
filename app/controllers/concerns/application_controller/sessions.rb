class ApplicationController < ActionController::Base
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    protected

    def current_user
      @current_user ||= User.cached_find(session[:user_id]) if session[:user_id]
    end
    def confirm_logged_in
      unless current_user
        redirect_to root_url
        false
      end
    end
    def logout
      session[:user_id] = nil
    end

  end
end
