class RegistrationsController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to products_path, notice: "You have successfully signed up."
    elsif @user.is_vendor?
      redirect_to new_admin_vendor_path, notice: "You have successfully signed up. Please register as a vendor."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
    :email,
    :password,
    :password_confirmation,
    :is_vendor?)
  end

end
