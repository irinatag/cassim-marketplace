Rails.application.routes.draw do

  get '/signup' => 'registrations#new', as: :signup
  post '/signup' => 'registrations#create'
  get '/signin' => 'authentication#new', as: :signin
  post '/signin' => 'authentication#create'
  get '/signout' => 'authentication#destroy'

  resources :products
  resources :vendors
  resources :users
  post "/mail" => "products#mail"

end
