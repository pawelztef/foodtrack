Rails.application.routes.draw do


  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :admins, :controllers => { :invitations => 'admins/invitations' }

  # devise_for :users
  # resources :users

  root 'pages#home'

  get 'pages/home', path: 'home'
  get 'pages/katering', path: 'katering'
  get 'pages/galeria', path: 'galeria'
  get 'pages/produkty', path: 'produkty'
  get 'pages/historia', path: 'historia'
  get 'posts/index', path: 'blog'
  get 'posts/show', path: 'post'
  get 'zapytania/new', path: 'kontakt'
  get 'zapytania/create'

  namespace :backend do
    resources :dashboards
    resources :admins
    resources :tracks
    resources :posts
  end

end
