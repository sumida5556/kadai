Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  resources :posts, only: [:index, :show, :new, :create]
  get "mypages", to: "mypages#index"
end