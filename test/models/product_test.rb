require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should not save a blank Product" do
    product = Product.new
    assert_not product.save, "saved the product without a name, description, quantity, cost, or MOQ"
  end

  test "Product needs a name to save" do
    product = Product.new(:description => 'a thing', :quantity => 400, :price => 55.5, :moq => 100)
    assert_not product.save, "saved without a name."
  end

  test "Product needs a description to save" do
    product = Product.new(:name => 'a thing', :quantity => 400, :price => 55.5, :moq => 100)
    assert_not product.save, "saved without a description."
  end

  test "Product needs a quantity to save" do
    product = Product.new(:name => 'A Product', :description => 'a thing', :price => 55.5, :moq => 100)
    assert_not product.save, "saved without a quantity."
  end

  test "Product needs a price to save" do
    product = Product.new(:name => 'A Product', :description => 'a thing', :quantity => 400, :moq => 100)
    assert_not product.save, "saved without a price."
  end

  test "Product needs a moq to save" do
    product = Product.new(:name => 'A Product', :description => 'a thing', :quantity => 400, :price => 55.5)
    assert_not product.save, "saved without an MOQ."
  end
end
