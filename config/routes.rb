  Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}, controllers: { sessions: 'users/sessions' }
  get 'users', to: "users#index"
  get 'users/:id', to: "users#show", as: "user"
  resources :products do
  	resources :comments
  end
  resources :order_items
  resource :cart, only: [:show, :destroy]

  get 'orders/:id', to: "orders#show", as: "order"
  get 'orders', to: "orders#index"
  
  get 'simple_pages/about', to: "simple_pages#about"
  get 'simple_pages/contact', to: "simple_pages#contact"
  post 'simple_pages/thank_you'

  root 'simple_pages#index'

  post 'payments', to: "payments#create"
end
