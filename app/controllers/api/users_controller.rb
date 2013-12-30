module Api
  class UsersController < ApiController
    
    before_action :require_login
    respond_to :json

    def index
      @users = User.page(params[:page]).per(10)
      render json: @users, meta: {total_pages: @users.total_pages, page: @users.current_page}
    end
  end
end
