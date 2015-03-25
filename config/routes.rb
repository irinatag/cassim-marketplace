Rails.application.routes.draw do
  resources :products do
      collection { post :import }
  end
  
  resources :vendors
  resources :users


  root 'registrations#new'
  post "/mail" => "products#mail"
  post 'buy' => 'products#buy'
  #post '/reserve' => 'products#reserve_product'

  # registration
  get '/signup' => 'registrations#new', as: :signup
  post '/signup' => 'registrations#create'

  # authentication
  get '/signin' => 'authentication#new', as: :signin
  post '/signin' => 'authentication#create'
  get '/signout' => 'authentication#destroy'

end
