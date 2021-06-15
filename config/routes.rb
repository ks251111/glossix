Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  
  root to: "articles#index"
  resources :articles do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    member do
      get :followings, :followers
    end
  end
  resources :talks do
    resources :responses, only: :create
  end
  resources :categories, only: :show
  resources :relationships, only: [:create, :destroy]
end
