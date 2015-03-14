require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "should not save blank product" do
    vendor = Vendor.new
    assert_not vendor.save
  end

  test "should not save product without name" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:name)
  end

  test "should not save product without business email" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:email_biz)
  end

  test "should not save product without finance email" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:email_finance)
  end

  test "should not save product without address" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:address)
  end

  test "should not save product without city" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:city)
  end

  test "should not save product without state" do
    vendor = Vendor.new()
    assert_not vendor.save
    assert vendor.errors.has_key?(:state)
  end

end
