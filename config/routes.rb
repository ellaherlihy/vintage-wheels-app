Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :users, only: [:index]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars, only: [:index, :new, :create, :destroy, :show, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]
  get '/my_bookings', to: "bookings#my_bookings"
end
