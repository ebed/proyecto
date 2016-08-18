Rails.application.routes.draw do
  resources :profiles
  mount Ckeditor::Engine => '/ckeditor'
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
  resources :sells

  root 'static_pages#home'

  get 'about', to: 'static_pages#about', as: :about
  get 'faq', to: 'static_pages#faq', as: :faq
  get 'contactsite', to: 'static_pages#contact', as: :contactsite
  get 'addimagenproduct/:id', to: 'products#addimages', as: :addimagesproduct
  get 'addarticle/:id', to: 'articles#new', as: :addarticle
  get 'home', to: 'static_pages#home', as: :home
  get 'home_categories/:id', to: 'static_pages#home2', as: :homecategories
  get 'home_subcategories/:id', to: 'static_pages#home3', as: :homesubcategories
  get 'search', to: 'static_pages#search', as: :search

end
