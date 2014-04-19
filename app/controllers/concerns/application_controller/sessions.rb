class ApplicationController < ActionController::Base
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_user
    end

    protected

    def current_user
      @current_user ||= User.active_cached_find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end

    def require_login
      redirect_to(root_url, status: 401) unless current_user
    end

    def logout
      session[:user_id] = nil
    end
  end
end
