FactoryGirl.define do  factory :user do
    
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
