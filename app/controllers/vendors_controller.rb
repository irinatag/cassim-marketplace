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

  private

  def vendor_params
    params.require(:vendor).permit(:name, :email_biz, :email_finance, :description, :address, :city, :state, :zipcode, :country, :phone)
  end

end
