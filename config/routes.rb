Rails.application.routes.draw do
  devise_for :users

  get "profile", to: 'pages#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :gardens do
    resources :bookings, except: [:destroy]
    resources :reviews, only: [:new, :edit, :create, :update]
  end
  resources :reviews, only: [:destroy]
  
  root to: 'pages#home'
end
