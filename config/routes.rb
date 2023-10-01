Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      # Paginate post with kaminari
      get '/page/:page', action: :index, on: :collection
    end
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end
end
