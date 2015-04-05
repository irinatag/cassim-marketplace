class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :email_biz, :email_finance, :address, :city, :state, :zipcode, :country, :phone, :image)
  end

end
