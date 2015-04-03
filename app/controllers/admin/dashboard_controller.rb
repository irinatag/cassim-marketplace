class Admin::DashboardController < ApplicationController
  before_filter :authenticate

  def index
    @vendor = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
