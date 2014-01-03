module Api
  class UsersController < ApiController
    
    before_action :require_login
    respond_to :json

    def index
      @users = User.page(params[:page])
      render json: @users, meta: {total_pages: @users.total_pages, page: @users.current_page}
    end

    def show
      respond_with User.cached_find(params[:id])
    end

    def create
      respond_with :api, User.create(user_params)
    end

    def update
      respond_with User.update(params[:id], user_params)
    end

    def destroy
      respond_with User.destroy(params[:id])
    end

    private

    def user_params
      params.require(:user).permit :nombres, :username, :email, :password
    end
  end
end
