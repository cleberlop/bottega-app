Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'

  resources :rooms, only: [:index, :show]
 	post "new_event", to: "rooms#new_event", as: "new_event"
end
