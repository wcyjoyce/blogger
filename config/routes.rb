Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root to: "posts#index"

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
    resources :upvotes, only: [:new, :create]
  end

  resources :upvotes, only: [:index]

  resources :messages, only: [:new, :create, :show]

  get "tags/:tag", to: "posts#index", as: "tag"

  get "users/:id/dashboard", to: "users#dashboard", as: "dashboard"
  get "users/:id/newsfeed", to: "users#newsfeed", as: "newsfeed"
  get "pages/about", to: "pages#about", as: "about"
end
