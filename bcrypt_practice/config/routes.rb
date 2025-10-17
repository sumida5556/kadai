Rails.application.routes.draw do
  root 'home#index'

  # ユーザー登録・マイページ表示用
  resources :users, only: [:new, :create, :show]

  # セッション（ログイン）用
  resource :session, only: [:new, :create, :destroy]

  # ログアウト用の明示的なルート
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
