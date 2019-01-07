Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  
  get 'simple_pages/about', to: "simple_pages#about"
  get 'simple_pages/contact', to: "simple_pages#contact"
  post 'simple_pages/thank_you'

  root 'simple_pages#index'
end
