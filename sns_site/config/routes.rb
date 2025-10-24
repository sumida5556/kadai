Rails.application.routes.draw do
  get "mypage/show"
  get "mypage/edit"
  get "mypage/update"
  get "home/index"
  resources :favorites
  resources :posts
  root "home#index"

  devise_for :users

  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end

  # or standalone favorites if you prefer:
  # resources :favorites, only: [:create, :destroy]

  get "/mypage", to: "mypage#show"
  get "/mypage/edit", to: "mypage#edit", as: :edit_mypage
  patch "/mypage", to: "mypage#update"
end
