TestOnapp::Application.routes.draw do

  devise_for :users
  resources :tickets do
    collection do
      get 'open'
      get 'on_hold'
      get 'closed'
    end
  end

  resources :search, only: [:index]
  resources :comments, only: [:create]

  root "home#index"

end
