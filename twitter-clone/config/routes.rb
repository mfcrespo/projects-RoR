Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tweets
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
