Rails.application.routes.draw do
  devise_for :users, only: []

  devise_scope :user do
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
  end

  resources :barrel

  inertia 'about' => 'About'

  root 'storefront#index'
end
