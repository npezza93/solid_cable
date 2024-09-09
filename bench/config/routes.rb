Rails.application.routes.draw do
  mount ActiveError::Engine => "/errors"
  mount ActionCable.server => "/cable"

  resources :rooms

  get "/ws" => "ws_debugger#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :rooms
  root "rooms#index"
end