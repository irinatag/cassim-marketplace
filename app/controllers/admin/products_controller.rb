class Admin::ProductsController < ApplicationController

  before_filter :authenticate

  before_action do
    @vendor = Vendor.find(params[:vendor_id])
  end

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = @vendor.products.all
  end

  def show
    @product = @vendor.products.find(params[:id])
  end

  def new
    @product = @vendor.products.new
  end

  def create
    @product = @vendor.products.new(product_params)

    if @product.save
      redirect_to admin_vendor_product_path(@vendor, @product), notice: "Product was successfully saved."
    else
      render :new
    end
  end

  def edit
    @product = @vendor.products.find(params[:id])
  end

  def update
    @product = @vendor.products.find(params[:id])
    @product.update(product_params)

    if @product.save
      flash[:success] = "Product was successfully updated."
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product was successfully deleted."
    redirect_to products_path
  end

  def mail
    @product = Product.find(params[:id])
    data = request.parameters
    quant = data[:qty]
    email = data[:email]
    ModelMailer.po_notification(@product, quant, email).deliver
    redirect_to @product
  end

  def reserve_product
    @product = Product.find(params[:id])
    data = request.parameters
    quant = data[:qty]
    @product.reserve(quant)
    redirect_to @product
  end

  def buy
    @product = Product.find(params[:id])
  end

  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Products were successfully imported."
  end

  def trending
    @products = Product.all.order("created_at DESC")
    @vendors = Vendor.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :moq, :when_ready, :brand, :sku, :properties, :msrp, :vendor_id, :category1, :category2, :upc, :restructions, :warehouse_zip, :warranty, :link1, :link1_title, :link2, :link2_title, :restrictions, :image)
  end
end
