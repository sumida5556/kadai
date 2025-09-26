Rails.application.routes.draw do
  root 'articles#index'  # 最初の画面を投稿一覧に
  resources :articles
end
