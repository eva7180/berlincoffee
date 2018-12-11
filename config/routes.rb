Rails.application.routes.draw do
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  
  root 'simple_pages#index'
end
