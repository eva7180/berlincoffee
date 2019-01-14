Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  get 'users', to: "users#index"
  get 'users/:id', to: "users#show", as: "user"
  resources :products do
  	resources :comments
  end
  resources :order_items
  resource :cart, only: [:show]
  
  get 'simple_pages/about', to: "simple_pages#about"
  get 'simple_pages/contact', to: "simple_pages#contact"
  post 'simple_pages/thank_you'

  root 'simple_pages#index'
end
