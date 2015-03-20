class ProductPdf < Prawn::Document
  def initialize(product)
    super()
    @product = product
    text_content
  end

  def text_content
    text "You made a PDF! MAGIC! This is the product:"
    text @product.name
  end
end
