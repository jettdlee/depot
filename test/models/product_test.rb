require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "produce attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "skjbsdf"
      description: "skljhbsdb"
      image_url: "test.png"
    )   

    product.price = -1
    assert product.invalid?
    assert_equal ["> 0.01"], product.errors[:price]

    product.price = -1
    assert product.invalid?
    assert_equal ["> 0.01"], product.errors[:price]
    
  end



end
