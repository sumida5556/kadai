Rails.application.routes.draw do
  get "mypage/show"
  get "home/index"
  # Deviseのルーティング
  devise_for :users

  # トップページ
  root "home#index"

  # マイページ（ログイン後のみアクセス可）
  get "mypage", to: "mypage#show"
end
