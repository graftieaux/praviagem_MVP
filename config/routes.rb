Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals, only: [:index, :show, :new, :create] do
    resources :orders, only: :create
    #resources :meal_rating, only: :create
    #resources :customer_favorite_shop, only: [:create, :update]
  end

  namespace :customer do
    resources :orders, only: [:show, :index]
  end

  namespace :shop do
    resources :orders, only: [:show, :index]
  end
  #resources :shops, only: [:index, :create, :new, :update]
  #resources :users, only: [:index, :edit, :update]

  #namespace :admin do
   # resources :meals, only: [:index]
  #  resources :orders, only: [:index, :update]
  #end
end
