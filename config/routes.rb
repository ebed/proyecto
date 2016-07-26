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
  resources :categories
  resources :static_pages
  resources :imagenesarticulos
  root 'static_pages#home'

  get 'about', to: 'static_pages#about', as: :about
  get 'contact', to: 'static_pages#contact', as: :contact
  get 'addimagenproduct/:id', to: 'products#addimages', as: :addimagesproduct
  get 'home/:id', to: 'static_pages#home', as: :homecategories

end
