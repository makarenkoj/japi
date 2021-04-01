Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :session, only: %i[create destroy]
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
end
