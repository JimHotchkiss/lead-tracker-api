class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user)
    else
      render json: {
        error: "Invalid login information"
      }
    end
  end

  def destroy
    session[:user_id] = nil 
    render json: {
      notice: "Successfully logged out"\
    }
  end


  private

  def session_params
    params.require(:user).permit(:id, :username, :email, :password)
  end


end
