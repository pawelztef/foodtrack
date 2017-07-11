Rails.application.routes.draw do


  namespace :backend do
  get 'settings/index'
  end

  mount Ckeditor::Engine => '/ckeditor'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :admins, :controllers => { :invitations => 'admins/invitations' }

  # devise_for :users
  # resources :users

  root 'pages#home'

  get 'pages/home', path: 'home'
  get 'pages/galeria', path: 'galeria'
  get 'pages/produkty', path: 'produkty'
  get 'pages/historia', path: 'historia'
  get 'pages/produkt_show', path: 'produkt'

  resources :posts, path: 'blog'

  get 'queries/new', path: 'kontakt'
  post 'queries/create'
  get 'catering_queries/new', path: 'katering'
  post 'catering_queries/create'

  namespace :backend do
    resources :dashboards
    resources :admins
    resources :tracks

    resources :posts do
      collection do
        post 'delete_image'
        get 'add_image', to: 'posts#add_image'
      end
    end
    resources :products
    resources :fposts
    resources :home_pages
    resources :galeria_pages
    resources :historia_pages
    resources :kontakt_katering_pages
    resources :kontakt_pages
    resources :produkt_pages
    resources :mailbox, path: 'mailbox'
    resources :images, only: [:new, :create, :destroy, :index]
    post 'stops/activate'

    resources :settings do
      collection do
        get 'authenticate'
        post 'index'
      end
    end

  end

end
