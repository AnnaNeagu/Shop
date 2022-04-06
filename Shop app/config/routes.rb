Rails.application.routes.draw do
  get 'baskets/show'
  get 'cards/show'
  # get 'shops/index'
  # get 'shops/show'
  # resources :products

  resources :products, only:[:index, :show]
  resources :order_items
  resource :baskets, only:[:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :products
  # Defines the root path route ("/")
  # root "articles#index"
  root "products#index"
  # get "/products", to: "products#show"
end
