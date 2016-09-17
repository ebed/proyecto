Rails.application.routes.draw do

  get 'segments/index'

  get 'segments/update'

  get 'segments/destroy'

  get 'segments/create'

  get 'segments/new'

  devise_for :users, :controllers => {:registrations => "registrations"}


get '/404', to: 'errors#not_found'
get '/500', to: 'errors#server_error'



  resources :statusorders
  resources :paymentmethods
  resources :profiles
  mount Ckeditor::Engine => '/ckeditor'
  resources :contactypes

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
  resources :main_orders
  resources :payments
  resources :product_images



  resources :colors
  resources :tallas

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
  get 'orders_tienda/:id', to: 'orders#orders_tienda', as: :orders_tienda
  get 'productos_marca/:id', to: 'static_pages#listaxmarca', as: :productos_marca
  get 'agregaracarro', to: 'products#agregaracarro', as: :agregaracarro

end
