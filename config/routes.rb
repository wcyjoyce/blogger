Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end

  get "tags/:tag", to: "posts#index", as: "tag"

  get "users/:id/dashboard", to: "users#dashboard", as: "dashboard"
  get "pages/contact", to: "pages#contact", as: "contact"
end
