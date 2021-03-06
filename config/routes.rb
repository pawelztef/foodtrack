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
  get 'pages/polityka_prywatnosci', path: 'polityka_prywatnosci'

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
    resources :blog_pages
    resources :kontakt_katering_pages
    resources :kontakt_pages
    resources :policy_pages
    resources :produkt_pages
    resources :mailbox, path: 'mailbox' do
      collection do
        post :send_reply_mail, to: 'mailbox#send_reply_mail' 
        get  :new_mail
        post :send_mail, to: 'mailbox#send_mail'
      end
    end
    resources :images, only: [:new, :create, :destroy, :index]
    resources :products
    resources :posts
    resources :fposts do
      collection do
        post 'delete_image'
        get 'add_image', to: 'fposts#add_image'
      end
    end
    post 'stops/activate'
    resources :settings do
      collection do
        get 'authenticate'
        post 'index'
      end
    end

  end

end
