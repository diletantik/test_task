TestOnapp::Application.routes.draw do

  devise_for :users
  resources :tickets

  root "home#index"

  get 'tickets/:link', controller: 'tickets', action: 'show'
  post '/tickets/comment_create', controller: 'tickets', action: 'comment_create'
  get '/open_tickets', controller: 'tickets', action: 'open_tickets'
  get '/on_hold_tickets', controller: 'tickets', action: 'on_hold_tickets'
  get '/closed_tickets', controller: 'tickets', action: 'closed_tickets'

  post '/ticket_update/:id', controller: 'tickets', action: 'update'

  post '/search', controller: 'search', action: 'search_ticket'

end
