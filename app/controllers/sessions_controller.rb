# encoding: utf-8
class SessionsController < ApplicationController
  def create
    if @user = login(params[:username], params[:password])
      @user.active ? logged_in : inactive_account
    else
      render json: {message: "Verifica tu nombre de usuario y contraseña"}, status: 422
    end
  end

  def logged_in
    render json: @user, serializer: CurrentUserSerializer
  end

  def inactive_account
    render json: {message: "Tu cuenta está inactiva"}, status: 422
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
