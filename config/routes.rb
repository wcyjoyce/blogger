Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  get "users/:id/dashboard", to: "users#dashboard", as: "dashboard"
end
