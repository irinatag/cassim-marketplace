Rails.application.routes.draw do
  resources :products
  resources :vendors

  post "/mail" => "products#mail"
  post "/products/:id/reserve_product"=> 'products#reserve_product'
end
