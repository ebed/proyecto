Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'

  get 'static_pages/about'

  resources :articles, :products
  resources :sellers
  resources :marcas
  resources :users
  resources :comments
  resources :scores
  resources :static_pages

  root 'static_pages#home'

  get 'about', to: 'static_pages#about', as: :about
  get 'contact', to: 'static_pages#contact', as: :contact

end
