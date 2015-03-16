Rails.application.routes.draw do

resources :products
resources :vendors
post "/mail" => "products#mail"

end
