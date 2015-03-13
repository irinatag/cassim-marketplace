class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      flash[:success] = "Vendor was successfully created."
      redirect_to vendor_path(@vendor.id)
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
      flash[:success] = "Vendor was updated!"
      redirect_to vendor_path(@vendor.id)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to vendors_path
    flash[:success] = "Vendor was successfully deleted." 
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :email_biz, :email_finance, :description, :address, :city, :state, :zipcode, :country, :phone)
  end

end
