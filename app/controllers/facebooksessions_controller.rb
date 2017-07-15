class FacebooksessionsController < ApplicationController
  before_action :authenticate_admin!

  def new
    if session[:auth_token] = env['omniauth.auth']['credentials']['token'] 
      redirect_to  backend_fposts_url
    else
      redirect_to backend_dashboards_url, notice: 'Wystąpił problem z logowaniem na konto Facebook.  Skontaktuj się z adminstratorem servera.'
    end
  end

  def destroy
    session[:facebook_credentials] = nil
    redirect_to backend_dashboards_url
  end
end
