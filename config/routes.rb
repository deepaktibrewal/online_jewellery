Rails.application.routes.draw do

  root 'access#login'

  get 'shopfronts/view'
  get 'shopfronts/cart'
  get 'shopfronts/usermail'

  get 'admin', to: 'categories#index'
  #get 'access/shop_front'
  #post 'access/shop_front'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :categories do
    member do
      get :delete
    end
  end

  resources :items do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
