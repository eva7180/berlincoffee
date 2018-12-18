Rails.application.routes.draw do
  resources :products
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  
  root 'simple_pages#index'
end
