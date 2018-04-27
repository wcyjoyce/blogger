Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"} do
    member do
      get :following, :followers
    end
  end

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :upvotes, only: [:new, :create]
  end

  resources :upvotes, only: [:index]
  resources :relationships, only: [:create, :destroy]

  resources :messages, only: [:new, :create, :show]

  get "tags/:tag", to: "posts#index", as: "tag"

  get "users/:id/dashboard", to: "users#dashboard", as: "dashboard"
  get "users/:id/newsfeed", to: "users#newsfeed", as: "newsfeed"
  get "users/:id/following", to: "users#following", as: "following"
  get "users/:id/followers", to: "users#followers", as: "followers"

  get "pages/home", to: "pages#home", as: "home"
  get "pages/about", to: "pages#about", as: "about"

  root to: "pages#home"
end
