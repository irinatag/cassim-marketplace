class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_order, :update_vendor

  def current_user
    User.find_by(id: session[:user_id])
  end

  def update_vendor
    if !session[:vendor_id].nil?
      User.find_by(id: session[:user_id]).update_attributes(vendor_id: @vendor.id)
    else
      return false
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def authenticate
    unless current_user
      redirect_to signin_path, notice: "You must be logged in to access this page."
      return false
    end
  end

end
