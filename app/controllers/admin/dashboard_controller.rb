class Admin::DashboardController < ApplicationController
  before_filter :authenticate

  def index
  end
end
