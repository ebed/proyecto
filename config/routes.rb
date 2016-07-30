Rails.application.routes.draw do
  resources :contactypes
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
  #resources :carrocompras
  resources :carros
  resources :tiendas
  resources :contacts

  root 'static_pages#home'

  get 'about', to: 'static_pages#about', as: :about
  get 'faq', to: 'static_pages#faq', as: :faq
  get 'contactsite', to: 'static_pages#contact', as: :contactsite
  get 'addimagenproduct/:id', to: 'products#addimages', as: :addimagesproduct
  get 'addarticle/:id', to: 'articles#new', as: :addarticle
  get 'home/:id', to: 'static_pages#home', as: :homecategories



end
