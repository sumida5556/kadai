Rails.application.routes.draw do
  root "cookings#index"

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :cookings, only: [:index, :show, :new, :create]
  resources :genres, only: [:new, :create]
end
