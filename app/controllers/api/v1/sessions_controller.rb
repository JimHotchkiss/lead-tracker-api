class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      # get_current_user
      render json: UserSerializer.new(@user)
    else
      render json: {
        error: "Invalid login information"
      }
    end
  end

  def destroy
    session.clear
    render json: {
      notice: "Successfully logged out"
    }
  end

  def get_current_user
    if logged_in?
      render json: UserSerializer.new(current_user)
    else
      render json: {
        error: "No one is logged in"
      }
    end
  end

  def get_user_leads 
    if logged_in? 
      render json: current_user.leads
    else 
      render json: { error: "An error has occured"}
    end 
  end 

  private

  def session_params
    params.require(:user).permit(:id, :username, :email, :password)
  end


end
