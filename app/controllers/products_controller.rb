class ProductsController < ApplicationController
  def index
    @products = Product.search(params)
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

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProductPdf.new(@product)
        send_data pdf.render, filename: 'product.pdf', type: 'application/pdf'
      end
    end
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Project was successfully deleted"
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
    redirect_to products_path, notice: "Products were imported."
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :moq, :when_ready, :brand, :sku, :mfr, :msrp, :vendor_id, :category1, :category2, :upc, :restructions, :warehouse_zip, :warranty, :link1, :link1_title, :link2, :link2_title, :restrictions, :image)
  end
end
