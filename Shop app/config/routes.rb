Rails.application.routes.draw do
  get 'cards/show'
  # get 'shops/index'
  # get 'shops/show'
  # resources :products

  resources :products, only:[:index, :show]
  resources :order_items
  resource :cards, only:[:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :products
  # Defines the root path route ("/")
  # root "articles#index"
  root "shops#index"
  # get "/products", to: "products#show"
end
