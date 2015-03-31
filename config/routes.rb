Rails.application.routes.draw do
  root 'registrations#new'
  resources :users
  resources :buyers, controller: 'registrations', type: 'Buyer'

  resources :vendors

  resources :products do
      collection { post :import }
  end

  namespace :admin do
   get '/dashboard', to: 'dashboard#index', as: '/'
  end

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
