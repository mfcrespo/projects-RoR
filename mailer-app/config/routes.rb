Rails.application.routes.draw do
  resources :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'users#index'
  get 'notifications/send_mail'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
