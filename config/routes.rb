Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
      # Paginate post with kaminari
      get '/page/:page', action: :index, on: :collection
    end
  end
end
