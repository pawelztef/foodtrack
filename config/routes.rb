Rails.application.routes.draw do




  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :admins, :controllers => { :invitations => 'admins/invitations' }
  # post '/tinymce_assets' => 'tinymce_assets#create'

  # devise_for :users
  # resources :users

  root 'pages#home'

  get 'pages/home', path: 'home'
  get 'pages/galeria', path: 'galeria'
  get 'pages/produkty', path: 'produkty'
  get 'pages/historia', path: 'historia'

  get 'posts/index', path: 'blog'
  get 'posts/show/:id', to: 'posts#show', as: 'post'

  get 'queries/new', path: 'kontakt'
  post 'queries/create'
  get 'catering_queries/new', path: 'katering'
  post 'catering_queries/create'

  namespace :backend do
    resources :dashboards
    resources :admins
    resources :tracks
    resources :posts
    resources :mailbox, only: [:index, :show], path: 'mailbox'
    post 'stops/activate'
  end

end
