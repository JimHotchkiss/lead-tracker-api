class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      get_user_leads
      render json: @user
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
      render json: current_user.leads
    else
      render json: {
        error: "No one is logged in"
      }
    end
  end

  def get_user_leads 
    binding.pry
  end 


end
