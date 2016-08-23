Rails.application.routes.draw do
  resources :statusorders
  resources :paymentmethods
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
  resources :orders
  resources :payments

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
  get 'pagar_orden/:id', to: 'orders#pagar_orden', as: :pagar_orden
  get 'preparar_orden/:id', to: 'orders#preparar_orden', as: :preparar_orden
  get 'enviar_orden/:id', to: 'orders#enviar_orden', as: :enviar_orden
  get 'cerrar_orden/:id', to: 'orders#cerrar_orden', as: :cerrar_orden


end
