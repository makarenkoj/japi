Rails.application.routes.draw do
  root 'posts#index'

  resources :users
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
end
