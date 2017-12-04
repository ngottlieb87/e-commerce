Rails.application.routes.draw do

  root  :to => "products#index"
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  resources :accounts do
    resources :orders
  end

  resources :products do
    resources :order_items
  end

  resources :order_items do
    resources :orders
  end
end
