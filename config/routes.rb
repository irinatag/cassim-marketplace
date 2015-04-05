Rails.application.routes.draw do

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  root 'registrations#new'
  resources :users
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :vendors, :only => [:index, :show]
  resources :charges

  get 'trending', to: 'products#trending'

  resources :products, only: [:index, :reserve_product, :show, :buy, :trending]

  namespace :admin do
   get '/dashboard/:id', to: 'vendors#dashboard'
   resources :vendors
   resources :products do
       collection { post :import }
   end
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
