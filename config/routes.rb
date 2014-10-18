Rails.application.routes.draw do

  root to: 'posts#index'

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :posts
    resources :users
  end

end
