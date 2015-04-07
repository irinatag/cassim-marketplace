class AuthenticationController < ApplicationController

  def new
    user = User.find_by_email(params[:email])
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       if session[:vendor_registration] == true
         session.delete(:vendor_registration)
         redirect_to new_admin_vendor_path, notice: "You have successfully signed in. Please register as vendor"
       else
         redirect_to products_path, notice: "You have successfully signed in."
       end
    else
       @sign_in_error = "Username / password combination is invalid"
       render :new
    end
  end

  def destroy
    session.clear
    redirect_to products_path, notice: "You have successfully signed out."
  end

end
