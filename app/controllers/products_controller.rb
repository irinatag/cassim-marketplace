class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC").search(params)
    @vendors = Vendor.all.search(params)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
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

  def trending
    @products = Product.all.order("created_at DESC")
    @vendors = Vendor.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :moq, :when_ready, :brand, :sku, :properties, :msrp, :vendor_id, :category1, :category2, :upc, :restructions, :warehouse_zip, :warranty, :link1, :link1_title, :link2, :link2_title, :restrictions, :image)
  end

end
