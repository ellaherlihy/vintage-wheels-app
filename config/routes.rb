Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars, only: [:index, :new, :create, :destroy, :show] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :destroy]
  get '/my_bookings', to: "bookings#my_bookings"
end
