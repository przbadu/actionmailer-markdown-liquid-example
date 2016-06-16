Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    member do
      get :send_email
    end
  end
end
