Rails.application.routes.draw do
  resources :categories
  # get "/", to: "welcome#index"
  resources :items do
    resources :comments, only: [:create]
    # items/id/comments
  end
  # resources :commets, only: [:edit]

  #user
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"

  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"


  root "items#index"
end
