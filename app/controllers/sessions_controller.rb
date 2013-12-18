# encoding: utf-8
class SessionsController < ApplicationController
  
  def create
    if user = login(params[:username], params[:password])
      render json: {token: user.token}
    else
      render json: {message: "Verifica tu nombre de usuario y contraseña"}, status: 422
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
