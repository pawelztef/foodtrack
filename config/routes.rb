Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'facebooksessions#new'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'facebooksessions#destroy', as: 'signout'

  mount Ckeditor::Engine => '/ckeditor'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :admins, :controllers => { :invitations => 'admins/invitations' }
  # devise_for :users
  # resources :users

  root 'pages#home'

  resources :posts, path: 'aktualnosci'

  get 'pages/home', path: 'home'
  get 'pages/galeria', path: 'galeria'
  get 'pages/produkty', path: 'menu'
  get 'pages/historia', path: 'historia'
  get 'pages/produkt_show', path: 'produkt'

  get 'queries/new', path: 'kontakt'
  post 'queries/create'
  get 'catering_queries/new', path: 'katering'
  post 'catering_queries/create'

  namespace :backend do
    resources :dashboards
    resources :admins
    resources :tracks
    resources :home_pages
    resources :galeria_pages
    resources :historia_pages
    resources :kontakt_katering_pages
    resources :kontakt_pages
    resources :produkt_pages
    resources :mailbox, path: 'mailbox'
    resources :images, only: [:new, :create, :destroy, :index]
    resources :products
    resources :fposts do
      collection do
        post 'delete_image'
        get 'add_image', to: 'fposts#add_image'
      end
    end
    post 'stops/activate'

    resources :posts do
      collection do
        post 'delete_image'
        get 'add_image', to: 'posts#add_image'
      end
    end


    resources :settings do
      collection do
        get 'authenticate'
        post 'index'
      end
    end

  end

end
