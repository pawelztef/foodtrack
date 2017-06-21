Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :admins, :controllers => { :invitations => 'admins/invitations' }

  # devise_for :users
  # resources :users

  root 'pages#home'

  get 'pages/contact'
  get 'pages/about'
  get 'pages/home'


  namespace :backend do
    resources :dashboards
    resources :admins
  end

end
