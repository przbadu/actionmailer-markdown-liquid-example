Rails.application.routes.draw do
  resources :posts do
    collection do
      get :example
    end
  end
  root 'users#index'
  resources :users do
    member do
      get :send_email
      get :welcome_email
    end
  end
end
