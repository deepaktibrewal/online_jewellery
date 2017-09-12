Rails.application.routes.draw do

  #get 'users/new'

  resources 'users', only: [:new, :create]

  root 'access#login'

  get 'shopfronts/view'
  get 'shopfronts/cart'
  get 'shopfronts/usermail'
  get 'shopfronts/wishlist'

  get 'admin', to: 'categories#index'
  #get 'access/shop_front'
  #post 'access/shop_front'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :categories

  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
