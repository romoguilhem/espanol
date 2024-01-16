Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  resources :games, only: [:show, :new, :create]
  post "/games/correction", to: "games#correction", as: "correction_game"

  # get '*unmatched_route', to: 'pages#home'
end
