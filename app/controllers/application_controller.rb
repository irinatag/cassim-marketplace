class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    unless current_user
      redirect_to signin_path, notice: "You must be logged in to access this page."
      return false
    end
  end

end
