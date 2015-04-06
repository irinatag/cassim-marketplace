class Admin::VendorsController < ApplicationController

  before_filter :authenticate

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      # current_user.update_attributes(is_vendor?: true)
      # session[:vendor_id] = @vendor.id
      puts "*" * 50
      current_user.vendor_id = 8888
      puts current_user.inspect
      puts "*" * 50
      current_user.save
      puts current_user.inspect
      puts "*" * 50
      # puts @vendor.id
      # puts current_user.inspect
      redirect_to admin_vendor_path(@vendor.id), notice: "Congratulations! You've been successfully added as a seller. Manage your profile settings from the Admin Panel below."
    else
      render :new
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_params)

    if @vendor.save
      redirect_to admin_vendor_path(@vendor.id), notice: "Vendor was updated!"
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    current_user.update_attributes(is_vendor?: false)
    current_user.save
    redirect_to products_path, notice: "Vendor Profile was successfully deleted."
  end

  def dashboard
    @vendor = Vendor.find(params[:id])
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :email_biz, :email_finance, :address, :city, :state, :zipcode, :country, :phone, :image, :avatar, :owner_name, :tagline)
  end

end
