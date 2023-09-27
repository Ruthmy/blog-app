Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index]
  end
end
