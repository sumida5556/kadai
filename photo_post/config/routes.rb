Rails.application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  get "users/show"
  get "users/edit"
  get "users/update"
  devise_for :users
  root 'users#show' # ログイン後マイページへ
  resources :users, only: [:show, :edit, :update]
  resources :posts
end
