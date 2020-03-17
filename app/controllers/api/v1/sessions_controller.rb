class Api::V1::SessionsController < ApplicationController

  def create

    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {
        error: "Invalid login information"
      }
    end
  end
end
