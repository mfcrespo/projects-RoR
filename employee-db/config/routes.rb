Rails.application.routes.draw do
  resources :employees do
    collection { post :import }
  end
  root 'employees#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
