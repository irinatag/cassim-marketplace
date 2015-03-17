class AuthenticationController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to products_path
    else
       @sign_in_error = "Username / password combination is invalid"
       render :new
    end
  end

  def destroy
    session.clear
    redirect_to products_path
  end

end
