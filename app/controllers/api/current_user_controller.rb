module Api
  class CurrentUserController < ApiController
    before_action :require_login

    respond_to :json

    def update
      if current_user.update_attributes(user_params)
        render json: current_user, serializer: UserSerializer
      else
        render json: current_user.errors, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit :nombres, :username, :email, :password
    end
  end
end
