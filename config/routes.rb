Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new,:create]
    collection do
      #GET /restaurants/top
      get :top
    end
    member do
      #restaurant id --> :id
      #GET /restaurants/42/chef
      get :chef
    end
  end
  resources :reviews, only: [ :destroy ]

  #GET /restaurants/42/chef
  #get "restaurants/top", to: "restaurants#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
