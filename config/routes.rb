Rails.application.routes.draw do

  resources :categories

  root to: 'posts#index'

  resources :posts, only: [:index, :show]
  resources :categories, only: [:index, :show]

  namespace :admin do
    resources :posts
    resources :users
    resources :categories
  end

  get 'login'  => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  get 'admin' => 'admin/posts#index'

  get 'about' => 'home#about'

  resources :sessions

end
