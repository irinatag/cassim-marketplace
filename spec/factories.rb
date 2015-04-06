FactoryGirl.define do  factory :order_item do
    product nil
order nil
unit_price "9.99"
quantity 1
total_price "9.99"
  end
  factory :order do
    subtotal "9.99"
tax "9.99"
shipping "9.99"
total "9.99"
order_status nil
  end
  factory :order_status do
    name "MyString"
  end
  factory :user do
    
  end

  factory :vendor do
    name "name"
    email_biz "email biz"
    email_finance "email finance"
    address "address"
    city "city"
    state "state"
    zipcode "zipcode"
    phone "phone"
  end

  factory :product do
    name "name"
    description "desc"
    price "price"
    quantity "quant"
    moq "moq"
  end
end
