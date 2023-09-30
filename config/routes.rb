Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index] do
      # Paginate post with kaminari
      get '/page/:page', action: :index, on: :collection
    end
  end
end
