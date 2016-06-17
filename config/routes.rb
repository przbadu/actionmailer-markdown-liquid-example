Rails.application.routes.draw do
  resources :posts
  root 'users#index'
  resources :users do
    member do
      get :send_email
    end
  end
end
