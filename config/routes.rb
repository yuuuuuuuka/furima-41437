Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items, only:[:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
