class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_user
    User.find_by(id: session[:user_id])
  end

  def get_user_leads 
    if logged_in? 
      render json: current_user.leads
    else 
      render json: { error: "An error has occured"}
    end 
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

  def logged_in?
    !!current_user
  end

end
