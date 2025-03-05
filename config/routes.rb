Rails.application.routes.draw do
  # Transacao routes
  get "/transacao", to: "transacao#index"
  get "/transacao/show_history", to: "transacao#show_history"
  post "/transacao/create", to: "transacao#create"
  get "/transacoes", to: "transacao#list"

  # Conta routes
  get "/conta", to: "conta#index"
  get "/conta/new", to: "conta#new"
  post "/conta", to: "conta#create"
  get "/conta/:id", to: "conta#show"
  get "/conta/:id/edit", to: "conta#edit"
  patch "/conta/:id", to: "conta#update"
  put "/conta/:id", to: "conta#update"
  delete "/conta/:id", to: "conta#destroy"
  put "/conta/:id/toggle_status", to: "conta#toggle_status"

  # Pessoa routes
  get "pessoa", to: "pessoa#index"
  get "pessoa/new", to: "pessoa#new"
  post "pessoa", to: "pessoa#create"
  get "pessoa/:id", to: "pessoa#show"
  get "pessoa/:id/edit", to: "pessoa#edit"
  patch "pessoa/:id", to: "pessoa#update"
  put "pessoa/:id", to: "pessoa#update"
  delete "pessoa/:id", to: "pessoa#destroy"

  # Home route
  root "home#index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Transacao routes
  get "/transacao", to: "transacao#index"
  get "/transacao/new", to: "transacao#new"
  get "/transacao/:id", to: "transacao#show"
  get "/transacao/:id/edit", to: "transacao#edit"
  patch "/transacao/:id", to: "transacao#update"
  put "/transacao/:id", to: "transacao#update"
  delete "/transacao/:id", to: "transacao#destroy"

  # Transacoes list route
  get "/transacoes", to: "transacao#list"
end
