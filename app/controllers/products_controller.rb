class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product saved"
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    if @product.save
      flash[:success] = "Product saved"
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :moq, :when_ready, :brand, :sku, :mfr, :msrp, :manufacturer, :category1, :category2, :upc, :restructions, :warehouse_zip, :warranty, :link1, :link1_title, :link2, :link2_title, :restrictions)
  end
end
