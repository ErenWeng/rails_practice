Rails.application.routes.draw do
  # get "/", to: "welcome#index"
  root "welcome#index"

  get "/login", to: "welcome#login"

end
