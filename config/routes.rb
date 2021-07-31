Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gardens, except: [:destroy]
  resources :users do
    resources :gardens, except: [:destroy]
  end
  resources :gardens, only: [:destroy]
end
