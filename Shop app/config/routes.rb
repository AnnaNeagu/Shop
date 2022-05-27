Rails.application.routes.draw do
  get 'baskets/order'
  get 'baskets/show'
  get 'cards/show'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products, only:[:index, :show, :new, :create]
  resources :order_items, only:[:create, :destroy, :update]
  
   
  resource :baskets, only:[:order, :show, :create]
  resource :discount, only: :update
  resolve("Discount") { route_for(:discount) }
 
  root "products#index"

 
  namespace :apis do
    namespace :products do
      namespace :v1 do
        resources :products
      end
    end
  end

  namespace :apis do
    namespace :products do
      namespace :v1 do
        resources :order_item
        resources :basket
      end
    end
  end

end
